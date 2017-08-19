require "rails_helper"
require "rack/test"

RSpec.describe PetsController, type: :controller do

  home = Dir.home
  filepath = File.join(home, "/battle-cats/db/cat1.jpg")

  let!(:user) {User.create!(email: "saham@att.net", password: "test")}
  let!(:pet) {Pet.create(name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", cuteness: 10, avatar: File.open(filepath))}
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

  describe "Cuteness points" do
    it "cuteness points increase when the method is called" do
    expect { pet.increase_cuteness }.to change { pet.cuteness }.by(1)
    end
  end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        
        home = Dir.home
        filepath = File.join(home, "/battle-cats/db/cat1.jpg")
  
        post :create,  params: { "user_id" => user.id, pet: {name: "Zee", animal_type: "Zee", bio: "a cute Zee", zipcode: "60192", cuteness: 10, avatar: Rack::Test::UploadedFile.new(filepath)}}

        pet_new = assigns(:pet)
        expect(pet_new.persisted?).to be true
      end
    end
  end

end


#To do:
# additional testing, add cuteness incrementor button to show page and the method for it