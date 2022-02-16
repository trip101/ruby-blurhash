Gem::Specification.new do |s|
    s.name        = 'blurhash_ruby'
    s.version     = '0.0.17'
    s.summary     = "A fast blurhash encoder/decoder gem!"
    s.description = "A fast blurhash encoder/decoder gem."
    s.authors     = ["Rabin Poudyal"]
    s.email       = 'rabin@trip101.com'
    s.files       = `git ls-files`.split("\n")
    s.require_paths = %w(lib)
    s.homepage    =
        'https://github.com/trip101/ruby-blurhash'
    s.license       = 'MIT'
    s.extensions = %w[ext/blurhash_decoder/extconf.rb ext/blurhash_encoder/extconf.rb]
end
