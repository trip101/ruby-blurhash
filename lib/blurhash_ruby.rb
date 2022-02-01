require File.expand_path('../blurhash_encoder/blurhash_encoder', __FILE__)
require File.expand_path('../blurhash_decoder/blurhash_decoder', __FILE__)

class Blurhash 
  def self.encode(image_url, x_comp = 4, y_comp = 3)
    BlurhashEncoder.new.blurhash(image_url, x_comp, y_comp)
  end

  def self.decode(blurhash, height = 2, width = 4, punch = 1)
    BlurhashEncoder.new.decode_blurhash(blurhash, height, width, punch)
  end
end