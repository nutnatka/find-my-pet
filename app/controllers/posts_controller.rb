class PostsController < ApplicationController

  def index
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @posts = Post.where(category: @category)
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to @post, notice: "Post has been created"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end
