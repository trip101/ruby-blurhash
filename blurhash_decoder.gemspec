# lib = File.expand_path('../lib/', __FILE__)
# $:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
    s.name        = 'blurhash_decoder'
    s.version     = '0.0.10'
    s.summary     = "A blurhash decoder gem!"
    s.description = "A simple blurhash decoder gem using c."
    s.authors     = ["Rabin Poudyal"]
    s.email       = 'rabin@trip101.com'
    s.files       = `git ls-files`.split("\n")
    s.require_paths = %w(lib)
    s.homepage    =
        'https://rubygems.org/gems/blurhash_decoder'
    s.license       = 'MIT'
    s.extensions = %w[ext/blurhash_decoder/extconf.rb ext/blurhash_encoder/extconf.rb]
end