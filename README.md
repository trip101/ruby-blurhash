## Blurhash Ruby
Generate a compact representation of a placeholder for an image in Ruby that can be saved in database, returned as API response and can be displayed as a blurred preview before the real image loads. This gem provides different options depending on the use case, either you want to store blurhash representation of the image(about 20-30 characters) and decode on the fly or you want to directly store the more longer(about 150 characters) base64 representation to skip decoding step, choice is yours!!
If you want to learn how blurhash works plese refer to the [original repository](https://github.com/woltapp/blurhash).

### Why this gem?
✅ No external dependencies \
✅ Contains both encoder and decoder \
✅ Faster than other ruby implementations 

### Installation
Add this line to your application's Gemfile:
```ruby
gem 'blurhash_ruby'
```

And then execute:
```ruby
$ bundle
```

Or install it yourself as:
```ruby
$ gem install blurhash_ruby
```

### Usage
```ruby
require 'blurhash_ruby'

BlurhashRuby.encode_image('https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_
_480.jpg')
# => "LMCFqys-0gIp-os,NHNI={s,R+I;"

# If you want to store shorter string in db and prepend data:image/png;base64, later
BlurhashRuby.decode_blurhash('LHB3~nxvjYax0Mo#o#t7-cayWBWE')
# => "iVBORw0KGgoAAAANSUhEUgAAAAQAAAACCAYAAAB/qH1jAAAALElEQVR4XmMMSUj///3bB4YfX18xfP/xkYGFjdmQ4S8bA8Pv/z8ZOFl/MgAANdoP6+z0zPQAAAAASUVORK5CYII="

# IF you want to directly generate data:image/png;base64, image - Useful for decoding on fly
 BlurhashRuby.decode_blurhash('LHB3~nxvjYax0Mo#o#t7-cayWBWE', as_img: true)
 # => "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAACCAYAAAB/qH1jAAAALElEQVR4XmMMSUj///3bB4YfX18xfP/xkYGFjdmQ4S8bA8Pv/z8ZOFl/MgAANdoP6+z0zPQAAAAASUVORK5CYII="
```

### Known Issues
Sometimes building native extension fails. You might have to install it this way:
```shell
gem install blurhash_ruby -- --with-cflags=\"-std=c99\"
```
OR,
Update the bundle config
```shell
bundle config build.blurhash_ruby --with-cflags=\"-std=c99\"
```

### Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
