class BloggersController < ApplicationController
  before_action :find_blogger, only: [:show, :update, :edit, :delete]

  def index
    @bloggers = Blogger.all
  end

  def show
    @post = @blogger.posts.ids
     @destinations = @blogger.destinations.ids
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)

    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)

    else
      @errors = @blogger.errors.full_messages
      render :new
    end
  end

  def update
    @blogger.update(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      @errors = @blogger.errors.full_messages
      render :edit
    end
  end

  def edit
  end

  def delete
    @bogger.destroy
    redirect_to bloggers_path
  end

  private

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
