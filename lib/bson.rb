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

# If we are using JRuby, attempt to load the Java extensions, if we are using
# MRI or Rubinius, attempt to load the C extenstions. If either of these fail,
# we revert back to a pure Ruby implementation of the Buffer class.
#
# @since 2.0.0
begin
  jruby? ? require("bson/native.jar") : require("bson/native")
rescue LoadError
  $stderr.puts("BSON is using the pure Ruby buffer implementation.")
end
