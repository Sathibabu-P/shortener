class HomeController < ApplicationController
  def index
    @link = Link.new
  end

  def stats
    @links = Link.includes(:impressionists).page(params[:page]).per(10)
  end

end
