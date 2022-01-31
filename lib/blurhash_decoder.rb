require "blurhash_decoder/blurhash_decoder"
require "blurhash_encoder/blurhash_encoder"
require 'base64'
require 'open-uri'


class BlurhashDecoder
  include DECODER
  #include ENCODER
  VERSION = "1.0"

  def decode_blurhash(blurhash, height, width, punch)
    decode(blurhash, height, width, punch)
    base64_image = File.open("tmp/out.png", "rb") do |file|
      Base64.strict_encode64(file.read)
    end
    base64_image
  end

  def blurhash(image_url)
    File.write 'tmp/in.png', open(image_url).read
    encode(4,3)
  end

end

puts BlurhashDecoder.new.decode_blurhash("LEAclNah=_xC0K%LInWo9tE2jvNH", 2, 5, 1)