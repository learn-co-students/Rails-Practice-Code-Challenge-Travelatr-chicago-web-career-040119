class DestinationsController < ApplicationController
  before_action :find_destination, only: [:show, :edit, :update, :delete]

  def index
    @destinations = Destination.all
  end

  def show
    @posts = @destination.posts
    @bloggers = @destination.bloggers
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.valid?
      @destination.save
      redirect_to destination_path(@destination)
    else
      @errors = @destination.errors.full_messages
      render :new
    end
  end

  def update
    @destination.update(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else
        @errors = @destination.errors.full_messages
        render :edit
    end
  end

  def edit
  end

  def delete
    @destination.destroy
    redirect_to destinations_path
  end

  private
  def find_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :country)
  end

end
