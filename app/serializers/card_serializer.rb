class CardSerializer < ActiveModel::Serializer
  attributes :id, :raw_name, :name, :card_code, :work_code, :color, :wing_type, :card_type, :level, :cost, :attack_value, :soul, :raw_url
  attributes :raw_content, :content, :raw_description, :description, :feature

  belongs_to :product
  belongs_to :new_product
  has_one :picture
  has_many :triggers
end
