class BloggersController < ApplicationController
  before_action :set_blogger, only: :show

  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)

    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      @errors = @blogger.errors.full_messages
      render :new
    end

  end

  def show
    @featured_post = @blogger.most_liked_posts(1).first
  end



  #====================================================
  private
  #====================================================

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

end
