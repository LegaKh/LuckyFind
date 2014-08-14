require 'rails_helper'

RSpec.describe PetsController, :type => :controller do

  context "when user loged in" do
    let(:user) { FactoryGirl.create(:user) }
    let(:pet) { FactoryGirl.create(:pet) }
    subject {pet.create_ad(user_id: user.id)}

    before do
      sign_in user
    end

      describe "GET #show" do 

          it "renders the show view" do 
            get :show, id: pet
            expect(response).to render_template :show
          end

          it "renders the show view" do 
            get :show, id: pet
            expect(response).to render_template :show
          end
      end

      describe "GET #new" do 

        it "assigns to requested pet to new pet" do
          get :new
          expect(assigns(:pet)).to be_new_record
        end

        it "renders the new view" do 
          get :new
          expect(response).to render_template :new
        end
      end

      describe "POST #create" do 
        context "with valid attributes" do
          it "creates new object" do
            expect{post :create, {pet: FactoryGirl.attributes_for(:pet), ad: FactoryGirl.attributes_for(:ad) }}.to change(Pet, :count).by(1)
          end

          it "redirects to index path" do
            post :create, {pet: FactoryGirl.attributes_for(:pet), ad: FactoryGirl.attributes_for(:ad) }
            expect(response).to redirect_to ads_pets_path
          end
        end
      end
    describe "GET #edit" do 

      it "assigns the requested pet to subject" do
        get :show, id: pet
        expect(assigns(:pet)).to eq(pet)
      end


    end

   end
end
