class Ad < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :user

  scope :pets, -> {where(content_type: 'Pet')}
  scope :docs, -> {where(content_type: 'Doc')}
  scope :license_plates, -> {where(content_type: 'LicensePlate')}
end
