require 'open-uri'
require File.expand_path('lib/blurhash_encoder/binary/blurhash_encoder')

class BlurhashEncoder
  include ENCODER
  
  def blurhash(image_url, x, y)
    File.write 'tmp/in.png', URI.open(image_url).read
    encode(x,y)
  end

end