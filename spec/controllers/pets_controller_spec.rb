# require "rails_helper"

# RSpec.describe PetsController, type: :controller do
#   let!(:user) {User.create!(email: "saham@att.net", password: "test")}
#   let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", cuteness: 10)}
#   before(:each) do
#     session[:user_id] = 1
#   end

#   it "has a 200 status code" do
#     get :index
#     expect(response.status).to eq (200)
#   end

#   it "has a collection of pets objects" do
#     get :index
#     expect(assigns(:pets)).to all(be_a Pet)
#   end

#   it "renders the index template" do
#     get :index
#     expect(response).to render_template("index")
#   end
# end

#Commenting this out temporarily as per-group discussion. - Matt
