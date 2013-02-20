# encoding: utf-8
require "bson/document"
require "bson/version"

begin
  require "bson/native"
rescue LoadError
  $stderr.puts("BSON is using the pure Ruby buffer implementation.")
end
