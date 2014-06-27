class AgmController < ApplicationController

  def index
    @tours = Tour.all
    @shuttles = Shuttle.all
  end

end
