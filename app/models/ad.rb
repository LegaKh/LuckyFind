class Ad < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :user

  scope :pets, -> {where(content_type: 'Pet')}
  scope :docs, -> {where(content_type: 'Doc')}
  scope :license_plates, -> {where(content_type: 'LicensePlate')}


  self.per_page = 5

  validates :title, :city, presence: true, length: { in: 2..70 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :street, allow_nil: true, length: { in: 0..20 }

end
