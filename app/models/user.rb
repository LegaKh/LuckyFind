class User < ActiveRecord::Base
  has_many :ads,             dependent: :destroy
  has_many :docs,            through: :ads, source: :content, source_type: "Doc"
  has_many :pets,            through: :ads, source: :content, source_type: "Pet"
  has_many :license_plates,  through: :ads, source: :content, source_type: "LicensePlate"
end
