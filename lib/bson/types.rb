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
    extend self

    # A string is type 0x02 in the BSON spec.
    #
    # @since 2.0.0
    STRING = 2.chr.freeze

    # A $minKey is type 0xFF in the BSON spec.
    #
    # @since 2.0.0
    MIN_KEY = 255.chr.freeze

    # A Mapping of all the BSON types to their corresponding Ruby classes.
    #
    # @since 2.0.0
    MAPPINGS = {
      STRING  => String,
      MIN_KEY => MinKey
    }

    # Get the class for the single byte identifier for the type in the BSON
    # specification.
    #
    # @example Get the type for the byte.
    #   BSON::Types.get("\x01")
    #
    # @return [ Class ] The corresponding Ruby class for the type.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def get(byte)
      MAPPINGS.fetch(byte)
    end
  end
end
