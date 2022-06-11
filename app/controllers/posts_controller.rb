class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  after_action :change_pet_status, only: [:create]

  def index
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @posts = Post.where(category: @category).page params[:page]
    else
      @posts = Post.all.page params[:page]
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(category_id: params[:category_id])
    @pets = Pet.where(user: current_user).order(:name)
  end

  def create
    postparams = post_params
    placeparms = places_params
    if !placeparms[:place_latitude].nil? && !placeparms[:place_longitude].nil?
      @place = Place.create(name: placeparms[:place_name], latitude: placeparms[:place_latitude], longitude: placeparms[:place_longitude] )
      @place.save
      postparams[:place_id] = @place.id;
    end

    @post = current_user.posts.create(postparams)

    if @post.save
      redirect_to @post, notice: 'Post has been created'
    else
      render :new
    end
  end

  private

  def places_params
    params.require(:post).permit(:place_name, :place_latitude, :place_longitude)
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :pet_id)
  end

  def change_pet_status
    @pet = @post.pet
    unless @pet.nil?
      if @post.category.name == 'lost_pets'
        @pet.lost!
      elsif @post.category.name == 'found_pets'
        @pet.found!
      elsif @post.category.name == 'pets_to_adopt'
        @pet.to_adopt!
      end
    end
  end
end
