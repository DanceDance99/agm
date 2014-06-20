class AgmController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
    @tours = Tour.all
  end
end
