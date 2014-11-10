class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    dog_params = params.require(:dog).permit(:breed, :age, :color)
    @dog = Dog.new(dog_params)
    @dog.save
    redirect_to dogs_path
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    dog_params = params.require(:dog).permit(:breed, :age, :color)
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path, notice: "Product was deleted"
  end
end
