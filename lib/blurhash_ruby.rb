# require File.expand_path('../blurhash_ruby/blurhash_encoder', __FILE__)
# require File.expand_path('../blurhash_ruby/blurhash_decoder', __FILE__)
require 'blurhash_ruby/blurhash_encoder'
require 'blurhash_ruby/blurhash_decoder'

require 'open-uri'
require 'base64'


class BlurhashRuby
  extend DECODER
  extend ENCODER
  
  def self.encode_image(image_url, x_comp = 4, y_comp = 3)
    # Usage: Blurhash.encode('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg')

    File.write 'tmp/in.png', URI.open(image_url).read rescue ''
    encode(x_comp,y_comp)
  end

  def self.decode_image(blurhash, height = 2, width = 4, punch = 1, as_img = false)
    # Usage: Blurhash.decode('LHB3~nxvjYax0Mo#o#t7-cayWBWE')
    
    decode(blurhash, height, width, punch)
    base64_image = File.open("tmp/out.png", "rb") do |file|
      Base64.strict_encode64(file.read)
    end
    as_img ? 'data:image/png;base64,' + base64_image : base64_image
  end
end
# Blurhash.encode_image('https://twilio-cms-prod.s3.amazonaws.com/images/MSjyG8qNtcrbONBpWKztYRJqSpr4R2M6K83KXW4dj05n5.width-1616.png')