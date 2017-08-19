class BattlesController < ApplicationController

  def show
  end

  def new
    @battle = Battle.new
    p params
    @pet_to_battle = Pet.find(params[:pet])
    @user = User.find(session[:user_id])
    @user_pets = @user.pets.all
    #current user
    #second user - which we get from @pet from show

  end

  def create
    p params
    @battle = Battle.create()

    @current_user_battle = PetBattle.create(pet_id: params[:pet], battle: @battle)
    @opponet_battle = PetBattle.create(pet_id: params[:battle][:pet_to_battle], battle: @battle)
    p @current_user_battle
    p @opponet_battle
    if @battle.save && @current_user_battle.save && @opponet_battle.save
      redirect_to battle_path(@battle)
    else
      render 'new'
    end

end
