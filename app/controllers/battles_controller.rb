class BattlesController < ApplicationController

  def show
    @battle = Battle.find_by(id: params[:id])
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
    p "Where am I?"
    p params
    @battle = Battle.create()

    @current_user_battle = PetBattle.create(pet_id: params[:pet], battle: @battle)
    @opponet_battle = PetBattle.create(pet_id: params[:battle][:pet_to_battle], battle: @battle)
    # get the opponent pet's owner 
    p @opponent_pet = Pet.find(params[:battle][:pet_to_battle])
    p @opponent_owner = @opponent_pet.owner
    p @current_user_battle
    p @opponet_battle
    if @battle.save && @current_user_battle.save && @opponet_battle.save
      # send email to the opponent to get into battle
      p "Sending email to opponent"
      UserBattleEmailMailer.notify_user(@opponent_owner)
      redirect_to battle_path(@battle)
    else
      render 'new'
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
    p @pet_battle_1
    p @pet_battle_2
    # update the pet_battle that belongs to the current_user

    p "Wheee!"
    p params[:score]
    p "look up!"
    respond_to do |format|
        format.html {render 'show'}
        format.js {p data}
    end
  end
end
