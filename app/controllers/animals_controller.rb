class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(created_at: :asc)
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render 'show'
    else
      render 'index'
    end
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path
    else
      render :edit
    end
  end

  def destroy
    Animal.find(params[:id]).destroy
    redirect_to animals_path
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :age, :hair_color, :eye_color, :gender, :alive)
    end
end
