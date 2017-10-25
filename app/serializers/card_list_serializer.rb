class CardListSerializer < ActiveModel::Serializer
  attributes :id, :raw_name, :name, :card_code, :color, :level, :cost, :attack_value, :soul

  belongs_to :product
  belongs_to :new_product
  has_one :picture
  has_many :triggers
end
