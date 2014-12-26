def cargar_pag(enlace)
  require 'nokogiri'
  require "net/http"
  require "uri"
  
  url = URI.parse(enlace)
  req = Net::HTTP::Post.new(url.path)
  
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  @return = http.request(req)
  resp = @return.body #.force_encoding("utf-8")
  # resp = resp.delete "&"
  
  return Nokogiri::HTML(resp)
  
end