class ToursController < ApplicationController
  before_action :require_admin, only: [:index, :new, :edit]

  layout 'admin'

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tours_params)
    if @tour.save
      flash[:success] = "Tour #{@tour.name} has been successfully added."
      redirect_to tours_path
    else
      flash[:error] = "The tour #{@tour.name} was not successfully saved. Please try again."
      render 'new'
    end
  end

  def show
    @shuttles = Shuttle.all
    @tours = Tour.all
    @tour = Tour.find_by(id: params[:id])
    @reservation = Reservation.new
    @tour_dates = @tour.tour_dates.where(:date => Date.today .. 12.months.from_now).where("available > 0").order('date asc')

    @tour.save if @tour.tour_date_rebuilt #hack to rebuild dates until a rake task is employeed

    render :layout => 'application'
  end

  def edit
    @tour = Tour.find_by(id: params[:id])
  end

  def update
    @tour = Tour.find_by(id: params[:id])
    @tour.update_column(:tour_date_rebuilt, true)

    if @tour.update_attributes(tours_params)
      flash[:success] = "#{@tour.name} has been successfully updated."
      redirect_to tours_path
    else
      flash[:error] = "#{@tour.name} has not been updated. Please try again."
      render 'edit'
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    flash[:notice] = "#{@tour.name} has been deleted."
    redirect_to tours_path
  end

  private

  def tours_params
    params.require(:tour).permit(:name, :amount, :time, :location, :duration, :description, :highlights, :start_date,  :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday)
  end
end
