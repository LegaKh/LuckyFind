class LicensePlatesController < ApplicationController
  before_action :set_license_plate, only: [:show, :edit, :update, :destroy]
  before_action :set_ad, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @license_plate = LicensePlate.new
    @ad = Ad.new
  end

  def edit
  end

  def create
    @license_plate = LicensePlate.new(license_plate_params)
    @license_plate.create_ad(ad_params)
    @license_plate.ad.user_id = current_user.id


    if @license_plate.save && @license_plate.ad.save
      redirect_to ads_license_plates_path, notice: 'License plate was successfully created.'
    else
      ender :new
    end
  end

  def update
      if (@ad.user_id == current_user.id) && @license_plate.update(license_plate_params) && @ad.update(ad_params)
        redirect_to ads_license_plates_path, notice: 'License plate was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @license_plate.destroy if @ad.user_id == current_user.id
    redirect_to ads_license_plates_url, notice: 'License plate was successfully destroyed.'
  end

  private

    def set_license_plate
      @license_plate = LicensePlate.find(params[:id])
    end

    def set_ad
      @ad = @license_plate.ad
    end

    def license_plate_params
      params.require(:license_plate).permit(:number)
    end

    def ad_params
      params.require(:ad).permit(:title, :city, :street, :date, :description)
    end
end
