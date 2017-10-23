class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer :card_id
      t.string :remote_url
      t.string :local_url
      t.timestamps
    end
    add_index :pictures, :card_id
  end
end
