require File.expand_path('../blurhash_ruby/blurhash_encoder', __FILE__)
require File.expand_path('../blurhash_ruby/blurhash_decoder', __FILE__)

require 'open-uri'
require 'base64'


class Blurhash 
  include ENCODER

  def self.encode(image_url, x_comp = 4, y_comp = 3)
    # Usage: Blurhash.encode('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg')

    File.write 'buffer/in.png', URI.open(image_url).read
    encode(x_comp,y_comp)
  end

  def self.decode(blurhash, height = 2, width = 4, punch = 1, as_img = false)
    # Usage: Blurhash.decode('LHB3~nxvjYax0Mo#o#t7-cayWBWE')
    
    decode(blurhash, height, width, punch)
    base64_image = File.open("buffer/out.png", "rb") do |file|
      Base64.strict_encode64(file.read)
    end
    as_img ? 'data:image/png;base64,' + base64_image : base64_image
  end
end
