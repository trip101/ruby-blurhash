#require 'benchmark'
#require 'blurhash_ruby'
#require 'blurhash'
#require 'rmagick'

#Benchmark.bm do |x|
#    x.report {
#        BlurhashRuby.encode_image('https://twilio-cms-prod.s3.amazonaws.com/images/MSjyG8qNtcrbONBpWKztYRJqSpr4R2M6K83KXW4dj05n5.width-1616.png')
#     }
#end
#
#Benchmark.bm do |x|
#    x.report {
#        image_url = 'https://twilio-cms-prod.s3.amazonaws.com/images/MSjyG8qNtcrbONBpWKztYRJqSpr4R2M6K83KXW4dj05n5.width-1616.png'
#        filename = 'in.png'
#        File.write filename, URI.open(image_url).read
#        file_path = Dir.pwd + "/#{filename}"
#        image = Magick::ImageList.new(file_path)
#        Blurhash.encode(image.columns, image.rows, image.export_pixels)
#     }
#end
