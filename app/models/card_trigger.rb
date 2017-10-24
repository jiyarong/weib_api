class CardTrigger < ApplicationRecord
  belongs_to :card
  belongs_to :trigger
end
