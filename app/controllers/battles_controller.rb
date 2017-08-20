class BattlesController < ApplicationController

  def show
    @battle = Battle.find_by(id: params[:id])
  end

  def new
    @battle = Battle.new
    @pet_to_battle = Pet.find(params[:pet])
    @user = User.find(session[:user_id])
    @user_pets = @user.pets.all
  end

  def create
    if params[:pet] == nil
      @pet_to_battle = Pet.find(params[:battle][:pet_to_battle])
      @user = User.find(session[:user_id])
      @user_pets = @user.pets.all
      flash[:error] = "You must select one of your pets to battle with!"
      render 'new'
    else
      @battle = Battle.create()
      @current_user_battle = PetBattle.create(pet_id: params[:pet], battle: @battle)
      @opponet_battle = PetBattle.create(pet_id: params[:battle][:pet_to_battle], battle: @battle)
      if @battle.save && @current_user_battle.save && @opponet_battle.save
        redirect_to battle_path(@battle)
      else
        render 'new'
      end
    end
  end

  def update
    @battle = Battle.find_by(id: params[:id])
    @pet_battle_1 = @battle.pet_battles[0]
    @pet_battle_2 = @battle.pet_battles[1]

    if @pet_battle_1.pet.owner_id == current_user.id
      @pet_battle_1.update_attributes(button_score: params[:score])
    else
      @pet_battle_2.update_attributes(button_score: params[:score])
    end
    respond_to do |format|
        format.html {render 'show'}
        format.js {data}
    end
  end
end
