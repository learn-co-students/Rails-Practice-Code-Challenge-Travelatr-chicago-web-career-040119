class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  # def index
  #   @posts = Post.all
  # end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    @bloggers = Blogger.all
    @destinations = Destination.all
    @post.likes = 0

    if @post.save
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end

  def likes_plus_one
    post = Post.find(params[:post_id])
    post.likes += 1
    post.save
    redirect_to post_path(post)
  end

  def show
    @blogger = @post.blogger
    @destination = @post.destination
  end

  def edit

  end

  def update

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end

end
