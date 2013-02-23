require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"

require_relative "perf/bench"
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

def extension
  RUBY_PLATFORM =~ /darwin/ ? "bundle" : "so"
end

def compile!
  puts "Compiling native extensions..."
  Dir.chdir(Pathname(__FILE__).dirname + "ext/bson") do
    `bundle exec ruby extconf.rb`
    `make`
    `cp native.#{extension} ../../lib/bson`
  end
end

task :compile do
  compile!
end

task :clean do
  puts "Cleaning out native extensions..."
  begin
    Dir.chdir(Pathname(__FILE__).dirname + "lib/bson") do
      `rm native.#{extension}`
    end
  rescue Exception => e
    puts e.message
  end
end

namespace :benchmark do

  task :ruby => :clean do
    puts "Benchmarking pure Ruby..."
    require "bson"
    benchmark!
  end

  task :c => :compile do
    puts "Benchmarking with C extensions..."
    require "bson"
    benchmark!
  end
end

task :default => :spec
task :bench => [ "benchmark:ruby", "benchmark:c" ]
