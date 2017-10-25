class NewProductSerializer < ActiveModel::Serializer
  attributes :id, :raw_name, :name
end
