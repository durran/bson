# encoding: utf-8
require "bson/min_key"

module BSON

  # Provides constant values for each to the BSON types and mappings from raw
  # bytes back to these types.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  module Types

    # A string is type 0x02 in the BSON spec.
    #
    # @since 2.0.0
    STRING = 2.chr.freeze

    # A $minKey is type 0xFF in the BSON spec.
    #
    # @since 2.0.0
    MIN_KEY = 255.chr.freeze
  end
end
