class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :city
      t.string :street
      t.date :date
      t.text :description
      t.integer :user_id
      t.integer :content_id
      t.string :content_type

      t.timestamps
    end
  end
end
