# encoding: utf-8
module BSON

  # This module provides behavior for encoding specific values to the output
  # stream. Depending on the environment, the appropriate c or java
  # implementation will be used, or the native ruby one.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  module Encoder

    begin
      if RUBY_ENGINE == "jruby"
        require "bson/encoder/native.jar"
      else
        require "bson/encoder/native"
      end
      extend Native
    rescue LoadError
      require "bson/encoder/ruby"
      extend Ruby
    end
  end
end
