class Card < ApplicationRecord
  belongs_to :product
  belongs_to :new_product
  has_many :card_triggers, dependent: :delete_all
  has_many :triggers, class_name: "Trigger",  through: "card_triggers", dependent: :delete_all
  has_one :picture, dependent: :destroy

  def product_name
    product.raw_name
  end

  def new_product_name
    new_product.raw_name
  end

  def picture_url
    picture.local_url
  end
end
