class ProductSerializer < ActiveModel::Serializer
  attributes :id, :raw_name, :name
end
