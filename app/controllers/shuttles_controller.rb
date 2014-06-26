class ShuttlesController < ApplicationController
  before_action :require_admin, only: [:index, :new, :edit]
  before_action :load_shuttle, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  def index
    @shuttles = Shuttle.all
  end

  def new
    @shuttle = Shuttle.new
    # @shuttle.shuttle_cities.build
  end

  def create
    @shuttle = Shuttle.new(shuttles_params)
    if @shuttle.save
      flash[:success] = "shuttle #{@shuttle.name} has been successfully added."
      redirect_to shuttles_path
    else
      flash[:error] = "The shuttle #{@shuttle.name} was not successfully saved. Please try again"
      render 'new'
    end
  end

  def show
    @tours = Tour.all
    @booking = Booking.new
    @from_cities = @shuttle.shuttle_cities
    @to_cities = @shuttle.shuttle_cities

    @shuttle.save #hack to rebuild dates until a rake task is employeed

    render :layout => 'application'
  end

  def edit
  end

  def update
    if @shuttle.update_attributes(shuttles_params)
      flash[:success] = "#{@shuttle.name} has been successfully updated."
      redirect_to shuttles_path
    else
      flash[:error] = "#{@shuttle.name} has not been updated. Please try again."
      render 'edit'
    end
  end

  def destroy
    @shuttle.destroy

    flash[:notice] = "#{@shuttle.name} has been deleted."
    redirect_to shuttles_path
  end


  private

  def load_shuttle
    @shuttle = Shuttle.find_by_id(params[:id])

    #Temporary fix for home page
    redirect_to Shuttle.first unless @shuttle

  end

  def shuttles_params
    params.require(:shuttle).permit(:name, :amount, :start_date, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, {:shuttle_cities_attributes => [:id, :name]}, :round_trip_amount, :group_amount, :group_round_trip_amount )
  end
end
