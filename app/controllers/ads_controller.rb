class AdsController < ApplicationController
 
  def index
    @content = Ad.all
  end

  def pets
    @content = Ad.pets
  end

  def docs
    @content = Ad.docs
  end

  def license_plates
    @content = Ad.license_plates
  end

end
