require 'blurhash_encoder'

class Blurhash 
  def self.encode(image_url, x_comp = 4, y_comp = 3)
    # Usage: Blurhash.encode('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg')
    BlurhashEncoder.new.blurhash(image_url, x_comp, y_comp)
  end

  # def self.decode(blurhash, height = 2, width = 4, punch = 1, as_img = false)
  #   # Usage: Blurhash.decode('LHB3~nxvjYax0Mo#o#t7-cayWBWE')
  #   hash = BlurhashDecoder.new.decode_blurhash(blurhash, height, width, punch)
  #   as_img ? 'data:image/png;base64,' + hash : hash
  # end
end
