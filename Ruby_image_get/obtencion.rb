require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'open-uri'
peticion = "opendata/api/red/radar/regional/va"
api_key = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkdXJhbmNkcjk2QGdtYWlsLmNvbSIsImp0aSI6IjBiMmFlZDI5LWZiZjItNDA2NS1hNTU3LTdhNjk3ZWM2YTQzNCIsImV4cCI6MTUwNTk3ODk2NiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE0OTgyMDI5NjYsInVzZXJJZCI6IjBiMmFlZDI5LWZiZjItNDA2NS1hNTU3LTdhNjk3ZWM2YTQzNCIsInJvbGUiOiIifQ.BTgmiLouk2VDknXqWxGRBWrc2QGmEmw5wRNWAUDPcC8"
url = URI("https://opendata.aemet.es/"+peticion+"/?api_key="+api_key)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["cache-control"] = 'no-cache'
response = http.request(request)
data = JSON.parse(response.body)
url_image = data["datos"] +""
#image = url_image.split("/")[5]
#url_image = url_image[0,(url_image.length-8)]
puts url_image
#puts image

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

open(url_image) {|f|
   File.open("image.gif","wb") do |file|
     file.puts f.read
   end
}
