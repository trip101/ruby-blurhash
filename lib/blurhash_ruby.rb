require 'blurhash_ruby/blurhash_encoder'
require 'blurhash_ruby/blurhash_decoder'

require 'open-uri'
require 'base64'


class BlurhashRuby
  extend DECODER
  extend ENCODER
  
  def self.encode_image(image_url, x_comp = 4, y_comp = 3)
    # Usage: BlurhashRuby.encode_image('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg')
    filename = 'in.png'
    File.write filename, URI.open(image_url).read
    file_path = Dir.pwd + "/#{filename}"
    encode(file_path, x_comp, y_comp)
  end

  def self.decode_blurhash(blurhash, height = 2, width = 4, punch = 1, as_img = false)
    # Usage: BlurhashRuby.decode_blurhash('LHB3~nxvjYax0Mo#o#t7-cayWBWE')
    filename = 'out.png'
    file_path = Dir.pwd + "/#{filename}"

    decode(file_path, blurhash, height, width, punch)
    base64_image = File.open(file_path, "rb") do |file|
      Base64.strict_encode64(file.read)
    end
    as_img ? 'data:image/png;base64,' + base64_image : base64_image
  end
end