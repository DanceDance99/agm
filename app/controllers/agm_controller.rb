class AgmController < ApplicationController
  before_filter :require_admin

  def index
    @tours = Tour.all
  end

  def show
  end
end
