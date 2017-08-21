require "rails_helper"
require "rack/test"

RSpec.describe PetsController, type: :controller do

  home = Dir.home
  filepath = File.join(home, "/battle-cats/public/cat1.jpg")

  let!(:user) {User.create!(email: "saham@att.net", password: "test")}
  let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", owner: user, avatar: File.open(filepath))}
  before(:each) do
    session[:user_id] = 1
  end

  describe "Get # index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq (200)
    end

    it "has a collection of pets objects" do
      get :index
      expect(assigns(:pets)).to all(be_a Pet)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Get # view " do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq (200)
    end

    it "create a new pet" do
      get :new
      expect(assigns(:pet)).to be_a_new Pet
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # describe "Cuteness points" do
  #   it "increases the points by one when /votes is accessed" do
  #     # p pet
  #     # put :vote, params: {id: pet.id}
  #     # expect(response).to include 11;
  #     expect {
  #       put :vote, params: {id: pet.id}
  #     }.to change(pet, :cuteness)

  #   end
  # end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do

        home = Dir.home
        filepath = File.join(home, "/battle-cats/public/cat1.jpg")

        post :create,  params: { "user_id" => user.id, pet: {name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", avatar: Rack::Test::UploadedFile.new(filepath)}}

        pet_new = assigns(:pet)
        expect(pet_new.persisted?).to be true
      end


    end
  end

  describe "routes for pets", :type => :routing do
    home = Dir.home
    filepath = File.join(home, "/battle-cats/public/cat1.jpg")
    let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", avatar: File.open(filepath))}
    it "routes /pets to /pets/:id action " do

      expect(get("/pets/1")).to route_to(controller: "pets",
        action: "show",
        id: "1")

    end

    it "routes /users/:user_id/pets  to create a pet " do

      expect(post("/users/1/pets")).to route_to(controller: "pets",
        action: "create",
        user_id: "1")

    end
   end


end


#To do:
# additional testing, add cuteness incrementor button to show page and the method for it
