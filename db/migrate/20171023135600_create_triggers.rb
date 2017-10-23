class CreateTriggers < ActiveRecord::Migration[5.1]
  def change
    create_table :triggers do |t|
      t.string :raw_name
      t.string :name
      t.timestamps
    end
  end
end
