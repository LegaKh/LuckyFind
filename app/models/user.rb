class User < ActiveRecord::Base
  extend Enumerize
  enumerize :role, in: { user:1, admin:2 }, default: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ads,             dependent: :destroy
  has_many :docs,            through: :ads, source: :content, source_type: "Doc"
  has_many :pets,            through: :ads, source: :content, source_type: "Pet"
  has_many :license_plates,  through: :ads, source: :content, source_type: "LicensePlate"

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }

  validates :phone, presence: true

  validates_associated :ads, :docs, :pets, :license_plates

end
