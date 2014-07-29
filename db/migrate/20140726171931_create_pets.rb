class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :pet_type
    end
  end
end
