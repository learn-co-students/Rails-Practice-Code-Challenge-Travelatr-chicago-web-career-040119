class DestinationsController < ApplicationController
  before_action :set_destination, only: :show

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to destination_path(@destination)
    else
      @errors = @destination.errors.full_messages
      render :new
    end

  end

  def show
    @most_recent_posts = @destination.most_recent_posts(5)
    @featured_post = @destination.most_liked_posts(1).first

    unless @destination.bloggers.empty?
      @sum_all_bloggers_age = @destination.bloggers.inject(0) do |sum, blogger| sum + blogger.age
      end

      @avg_blogger_age = @sum_all_bloggers_age / @destination.bloggers.length
    end



  end
  #====================================================
  private
  #====================================================

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :country)
  end
end
