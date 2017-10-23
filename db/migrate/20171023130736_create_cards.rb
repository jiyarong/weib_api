class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :raw_name #原始卡名
      t.string :name #卡名
      t.string :card_code #卡号
      t.integer :rarity #稀有度
      t.integer :card_type #卡片种类
      t.integer :product_id #产品类别
      t.integer :new_product_id #新产品类别
      t.integer :wing_type #黑翼白翼
      t.string :work_code #工作号码
      t.integer :color #颜色
      t.integer :level #等级
      t.integer :cost #花费
      t.float :attack_value #攻击力
      t.integer :soul #灵魂值
      t.string :raw_url #原始链接
      t.text :raw_content
      t.text :content
      t.text :raw_description
      t.text :description
      t.string :feature #特征


      t.timestamps
    end
    add_index :cards, :rarity
    add_index :cards, :card_type
    add_index :cards, :product_id
    add_index :cards, :new_product_id
    add_index :cards, :wing_type
    add_index :cards, :color
    add_index :cards, :level
    add_index :cards, :cost
    add_index :cards, :soul
  end
end
