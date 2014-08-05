class AdsController < ApplicationController
 skip_before_filter :authenticate_user!, only: [:pets, :docs, :license_plates]
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
