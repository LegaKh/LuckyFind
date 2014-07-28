class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type, limit: 30
    end
  end
end
