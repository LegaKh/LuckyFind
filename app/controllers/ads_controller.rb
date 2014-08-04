class AdsController < ApplicationController
  
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  def index
    @ads = Ad.all
  end

  def show
  end

  def edit
  end

  def new
    @ad = Ad.new
    @content = Pet.new
  end

  def create
  
    @ad = Ad.new(ad_params)
    @ad.user_id = current_user.id
    
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ad.destroy if current_user.id == @ad.user_id
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

    def create_cont(type, param)
      @content = type.capitalize.classify.constantize.new(param)
      @content.save
    end

    def set_ad
      @ad = Ad.find(params[:id])
    end

    def ad_params
      params.require(:ad).permit(:title, :city, :street, :date, :description)
    end

end
