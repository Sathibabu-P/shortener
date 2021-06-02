class LinksController < ApplicationController


  def create
    @link = ShortLink.new(link_params[:url]).generate
  end


  def show
    @link = Link.find_by(short_code: params[:short_code])
    if @link
      ImpressionistService.new(@link,request).track
      redirect_to @link.try(:url) 
    else
      render_404
    end
  end

  
  private

  def link_params
    params.require(:link).permit(:url)
  end

  def render_404
    render "errors/404", status: 404
  end



end
