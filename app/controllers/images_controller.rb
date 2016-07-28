class ImagesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @drink = Drink.find_by(id: params[:id])
    render 'new.html.erb'
  end

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
