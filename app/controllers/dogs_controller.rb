class DogsController < ApplicationController
  def index
  	@dogs = Dog.all
  end

  def show
  	@dog = Dog.find(params[:id])
  end

  def new 
  	@dog = Dog.new
  end

  def create
  	@dog = Dog.new(dog_params)
  	if @dog.save
  		redirect_to action:'index'
  	else
  		render 'new'
  	end
  end

  private 
  def dog_params
  	params.require(:dog).permit(:name,:age)
  end
end
