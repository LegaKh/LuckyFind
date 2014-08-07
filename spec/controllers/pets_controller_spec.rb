require 'rails_helper'

RSpec.describe PetsController, :type => :controller do

  context "when user loged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:pet) }
    #let(:ad) { Ad.new(content_type: 'Pet', content_id: subject.id, user_id: user.id) }
    let(:ad) { subject.create_ad(user_id: user.id) }

    before do
      sign_in user
    end

    describe "GET #show" do 
      it "assigns the requested pet to subject" do
        get :show, id: subject
        expect(assigns(:pet)).to eq(subject)
      end

      it "renders the show view" do 
        get :show, id: subject
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
        get :show, id: subject
        expect(assigns(:pet)).to eq(subject)
      end

      it "renders the show view" do 
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

# ne poshlo, no rabotaet kak nado :(
    describe "PATH #update" do
      context "with valid attributes" do
              before(:each) { @pet = FactoryGirl.create :pet
                     @ad = @pet.create_ad(user_id: user.id, content_type: 'Pet', content_id: @pet.id )}

        it "updates pet" do
          expect{ patch :update, id: @pet.user, pet: { pet_type: 'bird'}}.to change{ subject.reload.pet_type }.to('bird')
        end

        it "renders to index path" do
          patch :update, id: subject,  pet: { pet_type: 'bird'}
          expect(response).to redirect_to ads_pets_path
        end
      end    
    end




    describe "DELETE #destroy" do
      #before(:each) { @pet = FactoryGirl.create :pet}
      before(:each) { @pet = FactoryGirl.create :pet
                      @pet.create_ad(user_id: user.id, content_type: 'Pet', content_id: @pet.id )}

      it "deletes the pet" do
        expect { delete :destroy, id: @pet }.to change(Pet, :count).by(-1)
      end

      it "redirects to index" do
        delete :destroy, id: @pet
        expect(response).to redirect_to ads_pets_path
      end
    end




   end
end
