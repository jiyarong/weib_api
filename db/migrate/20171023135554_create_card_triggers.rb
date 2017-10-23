class CreateCardTriggers < ActiveRecord::Migration[5.1]
  def change
    create_table :card_triggers do |t|
      t.integer :card_id
      t.integer :trigger_id
      t.timestamps
    end
    add_index :card_triggers, :card_id
    add_index :card_triggers, :trigger_id
  end
end
