class PetsController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]


	def show
	end

	private
		def set_pet
			@pet = Pet.find(params[:id])
		end

		# def pet_params
		# 	params.require(:pet).permit(:name, :bio, :email, :password)
		# end
end

  def index
    @pets = Pet.all
  end

end

