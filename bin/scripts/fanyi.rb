appid = "20171024000090599"
password = "kme8uQLl9gljkgfqtEke"
salt = "123"

i = 1
Card.find_in_batches do |cards_group|
  cards_group.each do |card|
    begin

      %w/name content/.each do |col|
        q = card.send("raw_#{col}")
        puts "正在翻译第#{i}条, 原始#{col}#{q}"
        sign = Digest::MD5.hexdigest(appid + q + salt + password)
        url = "http://fanyi-api.baidu.com/api/trans/vip/translate?q=#{ERB::Util.url_encode(q)}&from=jp&to=zh&salt=123&sign=#{sign}&appid=#{appid}"
        result = JSON.parse(RestClient.get(url, "Content-Type" => "application/json"))
        card.send("#{col}=", result["trans_result"].map {|r| r["dst"]}.join(" "))  unless result["error_code"].present?
        puts "结果#{card.send(col)}"
      end
      card.save
      i += 1
    rescue => e
      puts e
      next
    end
  end
end