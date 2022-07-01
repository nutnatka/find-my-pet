class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  after_action :change_pet_status, only: :create
  before_action :set_post, only: %i[show edit update destroy change_pet_status]

  def index
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @posts = Post.where(category: @category, status: 'published').order(created_at: :desc).page params[:page]
    else
      @posts = Post.where(status: 'published').order(created_at: :desc).page params[:page]
    end
  end

  def show; end

  def new
    @post = Post.new(category_id: params[:category_id])
    @pets = Pet.where(user: current_user).order(:name)
  end

  def create
    postparams = post_params
    placeparms = places_params
    if !placeparms[:place_latitude].nil? && !placeparms[:place_longitude].nil?
      @place = Place.create(name: placeparms[:place_name], latitude: placeparms[:place_latitude], longitude: placeparms[:place_longitude])
      @place.save
      postparams[:place_id] = @place.id
    end

    @post = current_user.posts.create(postparams)

    if @post.save
      redirect_to @post, notice: 'Post has been created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post has been updated'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to user_posts_path(current_user), notice: 'The post has been successfully deleted.'
  end

  def user_posts
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result.order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def places_params
    params.require(:post).permit(:place_name, :place_latitude, :place_longitude)
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :pet_id, :date)
  end

  def change_pet_status
    @users = User.where(allow_notification: true)
    @pet = @post.pet
    unless @post.category.name == 'success_stories' || @post.category.name == 'recommendations'
      @pet.posts.joins(:category).where(category: { name: %i[lost_pets found_pets pets_to_adopt] }).where.not(id: @post.id).update_all(status: :archived, place_id: nil)
    end
    if @post.category.name == 'lost_pets'
      @pet.lost!
      NotificationMailer.with(users: @users, post: @post, pet: @post.pet).pet_lost.deliver_now
    elsif @post.category.name == 'found_pets'
      @pet.found!
      NotificationMailer.with(users: @users, post: @post, pet: @post.pet).pet_found.deliver_now
    elsif @post.category.name == 'pets_to_adopt'
      @pet.to_adopt!
      NotificationMailer.with(users: @users, post: @post, pet: @post.pet).pet_to_adopt.deliver_now
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
