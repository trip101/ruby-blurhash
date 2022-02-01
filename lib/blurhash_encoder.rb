require 'open-uri'
require_relative './blurhash_encoder/blurhash_encoder'

class BlurhashEncoder
  include ENCODER
  VERSION = "1.0"

  def blurhash(image_url, x, y)
    File.write 'tmp/in.png', URI.open(image_url).read
    encode(x,y)
  end

end

# puts BlurhashEncoder.new.blurhash("http://m.gettywallpapers.com/wp-content/uploads/2021/06/Windows-11-Wallpaper.png", 4, 3)