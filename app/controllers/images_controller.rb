class ImagesController < ApplicationController
  def create
    image = Image.new(
    url: params[:url],
    drink_id: params[:drink_id]
    )
    image.save
    flash[:success] = "Image successfully <strong>saved</strong>!"
    redirect_to "/drinks"
  end
end
