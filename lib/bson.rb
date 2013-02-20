# encoding: utf-8
require "bson/document"
require "bson/types"
require "bson/version"

# Determin if we are using JRuby or not.
#
# @example Are we running with JRuby?
#   jruby?
#
# @return [ true, false ] If JRuby is our vm.
#
# @since 2.0.0
def jruby?
  RUBY_ENGINE == "jruby"
end

begin
  jruby? ? require("bson/native.jar") : require("bson/native")
rescue LoadError
  $stderr.puts("BSON is using the pure Ruby buffer implementation.")
end
