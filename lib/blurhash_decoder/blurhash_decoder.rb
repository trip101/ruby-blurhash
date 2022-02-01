require File.expand_path('lib/blurhash_decoder/binary/blurhash_decoder')
require 'base64'

class BlurhashDecoder
  include DECODER

  def decode_blurhash(blurhash, height, width, punch)
    decode(blurhash, height, width, punch)
    base64_image = File.open("tmp/out.png", "rb") do |file|
      Base64.strict_encode64(file.read)
    end
    base64_image
  end

end