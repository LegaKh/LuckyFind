class Doc < ActiveRecord::Base
  has_one :ad, as: :content, dependent: :destroy
  has_one :user, through: :ad

  validates :doc_type, :doc_code, :first_name, :last_name, presence: true, length: { in: 2..22 }
end
