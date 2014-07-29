class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :doc_type
      t.string :doc_code
      t.string :first_name
      t.string :last_name
    end
  end
end
