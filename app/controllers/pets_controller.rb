class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @pet = Pet.new
    @ad = Ad.new
  end

  def edit
    authorize! :edit, @ad
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.create_ad(ad_params)
    @pet.ad.user_id = current_user.id

    if @pet.save && @pet.ad.save
      redirect_to ads_pets_path, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  def update
      authorize! :edit, @ad
      if @pet.update(pet_params) && @ad.update(ad_params)
        redirect_to ads_pets_path, notice: 'Pet was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    authorize! :destroy, @ad
    @pet.destroy
    redirect_to ads_pets_url, notice: 'Pet was successfully destroyed.'
  end

  private

    def set_pet
      @pet = Pet.find(params[:id])
    end

    def set_ad
      @ad = @pet.ad
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:pet_type)
    end

    def ad_params
      params.require(:ad).permit(:title, :city, :street, :date, :description)
    end
end
