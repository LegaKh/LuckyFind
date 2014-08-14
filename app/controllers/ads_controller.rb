class AdsController < ApplicationController
 skip_before_filter :authenticate_user!, only: [:pets, :docs, :license_plates]
  def index
    @content = Ad.paginate(:page => params[:page])
  end

  def pets
    @content = Ad.pets.paginate(:page => params[:page])
  end

  def docs
    @content = Ad.docs.paginate(:page => params[:page])
  end

  def license_plates
    @content = Ad.license_plates.paginate(:page => params[:page])
  end

end
