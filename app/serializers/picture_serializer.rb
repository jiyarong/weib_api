class PictureSerializer < ActiveModel::Serializer
  attributes :id, :remote_url, :local_url, :http_url
end
