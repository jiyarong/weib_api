class Card < ApplicationRecord
  belongs_to :product
  belongs_to :new_product
  has_many :card_triggers, dependent: :delete_all
  has_many :triggers, class_name: "Trigger",  through: "card_triggers", dependent: :delete_all
  has_one :picture, dependent: :destroy
end
