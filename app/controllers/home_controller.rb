class HomeController < ApplicationController
  def index
    @link = Link.new
  end

  def stats
    @links = Link.includes(:impressionists)
  end

end
