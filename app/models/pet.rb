class Pet < ActiveRecord::Base
  has_one :ad, as: :content, dependent: :destroy
  has_one :user, through: :ad

  validates :pet_type, presence: true
end
