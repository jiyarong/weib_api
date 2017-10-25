ActiveModel::Serializer.config.adapter = :json

module Kaminari
  module PageScopeMethods
    def pagination_info
      info = {}
      [:current_page, :total_pages, :total_count].each {|pag| info[pag] = self.send(pag)}
      info
    end
  end
end