class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :city, limit: 30
      t.string :street, limit: 30
      t.date :date
      t.text :description
      t.integer :user_id
      t.integer :content_id
      t.string :content_type

      t.timestamps
    end
  end
end
