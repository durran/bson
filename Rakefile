require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"

require_relative "lib/bson/version"

task :gem => :build
task :build do
  system "gem build bson.gemspec"
end

task :install => :build do
  system "sudo gem install bson-#{BSON::VERSION}.gem"
end

task :release => :build do
  system "git tag -a v#{BSON::VERSION} -m 'Tagging v#{BSON::VERSION}'"
  system "git push --tags"
  system "gem push bson-#{BSON::VERSION}.gem"
  system "rm bson-#{BSON::VERSION}.gem"
end

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
