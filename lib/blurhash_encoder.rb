require 'blurhash_ruby/blurhash_encoder'
require 'open-uri'

class BlurhashEncoder
  include ENCODER
  
  def blurhash(image_url, x, y)
    File.write 'tmp/in.png', URI.open(image_url).read
    encode(x,y)
  end

end