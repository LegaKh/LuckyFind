class LicensePlate < ActiveRecord::Base
  has_one :ad, as: :content, dependent: :destroy
  has_one :user, through: :ad

  validates :number, presence: true, length: { in: 2..20 }
end
