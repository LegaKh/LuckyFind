class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.string :email, limit: 30
      t.string :phone, limit: 15
      t.string :password, limit: 30

      t.timestamps
    end
  end
end
