class ImagesController < ApplicationController
  respond_to :html, :xml

  def new

  end

  def create
    @record = Image.new(image_params)

    @record.save
    respond_with (@record)
  end

  def show
    @record = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:record).permit(:image)
  end
end
