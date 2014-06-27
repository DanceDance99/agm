class AgmController < ApplicationController

  def index
    @tours = Tour.all
    @shuttles = Shuttle.all
  end

  def show
    @shuttles = Shuttle.all
    @tours = Tour.all
  end

end
