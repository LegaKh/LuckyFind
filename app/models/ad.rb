class Ad < ActiveRecord::Base
  belongs_to :content, polymorphic: true, dependent: :destroy
  belongs_to :user
end
