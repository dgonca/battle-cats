class BattlesController < ApplicationController

  def new
    @battle = Battle.new
    p params
    @pet = Pet.find(params[:pet])
    @user = User.find(session[:user_id])
    #current user
    #second user - which we get from @pet from show

  end

  # def create
  # end

end
