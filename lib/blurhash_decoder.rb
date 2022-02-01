require_relative "./blurhash_decoder/blurhash_decoder"
require 'base64'

class BlurhashDecoder
  include DECODER
  VERSION = "1.0"

  def decode_blurhash(blurhash, height, width, punch)
    decode(blurhash, height, width, punch)
    base64_image = File.open("tmp/out.png", "rb") do |file|
      Base64.strict_encode64(file.read)
    end
    base64_image
  end

end

# puts BlurhashDecoder.new.decode_blurhash("LEAclNah=_xC0K%LInWo9tE2jvNH", 2, 5, 1)