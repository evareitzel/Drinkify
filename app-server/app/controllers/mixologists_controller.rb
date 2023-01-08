class MixologistController < ApplicationController
  
  def index
    @mixologists = Mixologist.all

    render json: @mixologists
  end

  # def show 
  #   @mixologist = Mixologist.find(params[:id])
  # end

end