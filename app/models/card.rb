class Card < ApplicationRecord
  belongs_to :product
  belongs_to :new_product
  has_many :card_triggers, dependent: :delete_all
  has_many :triggers, class_name: "Trigger",  through: "card_triggers", dependent: :delete_all
  has_one :picture, dependent: :destroy

  COLOR = {red: 1, yellow: 2, blue: 3, green: 4}
  CARD_CODE = {'人物' => 1, '场景' => 2, '高潮' => 3}
  WING_TYPE= {'白' => 0, '黑' => 1}

  extend Enumerize
  enumerize :color, in: COLOR
  enumerize :card_type, in: CARD_CODE
  enumerize :wing_type, in: WING_TYPE

end
