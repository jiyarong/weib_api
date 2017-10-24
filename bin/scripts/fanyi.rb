appid = "20171024000090599"
password = "kme8uQLl9gljkgfqtEke"
salt = 123
Card.find_in_batches do |cards_group|
  cards_group.each do |card|
    begin
      %w/name content/.each do |col|
        q = col.send("raw_#{col}")
        salt = 123
        sign = Digest::MD5.hexdigest(appid + q + salt + password)
        result = RestClient::Request.execute(method: :get,
                                             url: "http://fanyi-api.baidu.com/api/trans/vip/translate",
                                             payload: {
                                                 "q" => ERB::Util.url_encode(q),
                                                 "from" => "jp",
                                                 "to" => "zh",
                                                 "salt" => salt,
                                                 "sign" => sign,
                                                 "Content-Type" => "application/json"
                                             })
      end
    end
  end
end