gem uninstall blurhash_ruby
rm -rf tmp/
gem build blurhash_ruby.gemspec
gem install blurhash_ruby-0.0.16.gem
cd ..
irb