class CreateLicensePlates < ActiveRecord::Migration
  def change
    create_table :license_plates do |t|
      t.string :number
    end
  end
end
