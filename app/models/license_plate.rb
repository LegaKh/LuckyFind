class LicensePlate < ActiveRecord::Base
  has_one :ad, as: :content, dependent: :destroy
end
