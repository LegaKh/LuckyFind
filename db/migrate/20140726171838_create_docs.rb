class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :type
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
    end
  end
end
