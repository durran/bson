# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "bson/version"

Gem::Specification.new do |s|
  s.name        = "bson"
  s.version     = BSON::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Durran Jordan"]
  s.email       = ["durran.jordan@10gen.com"]
  s.homepage    = "http://bsonspec.org"
  s.summary     = "Ruby Implementation of the BSON specification"
  s.description = "A full featured BSON specification implementation, in Ruby"
  s.license     = "Apache"

  s.required_ruby_version     = ">= 1.9.3"
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "bson"

  s.files        = Dir.glob("lib/**/*") + %w(CHANGELOG.md LICENSE README.md Rakefile)
  s.require_path = 'lib'
end
