class CreateNewProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :new_products do |t|
      t.string :name
      t.string :raw_name

      t.timestamps
    end
  end
end
