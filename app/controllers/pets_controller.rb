class PetsController < ApplicationController
	before_action :set_pet, only: [:show, :edit, :update, :destroy]

	def index
   	@pets = Pet.all
 	end

	def show
	end

  def new
    @user = User.find_by(id: params[:user_id])
    @pet = Pet.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @pet = @user.pets.build(pet_params)

    if @pet.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:avatar, :name, :animal_type, :bio, :zipcode)
    end
end

