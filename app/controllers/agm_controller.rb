class AgmController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
  end
end
