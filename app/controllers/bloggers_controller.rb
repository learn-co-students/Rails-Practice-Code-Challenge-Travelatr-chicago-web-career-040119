class BloggersController < ApplicationController

  before_action :find_blogger, only: [:show, :edit, :update, :destroy]


  def index
    @bloggers = Blogger.all
  end

  def show
    #
  end

  def new
    @blogger = Blogger.new
  end

  def edit
    #
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end


  def update
    if @blogger.update(blogger_params)
      redirect_to blogger_path(@blogger)
    else
      render :edit
    end
  end

  def destroy
    @blogger.delete
    redirect_to bloggers_path
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

end
