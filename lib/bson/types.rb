# encoding: utf-8
module BSON

  # Provides constant values for each to the BSON types and mappings from raw
  # bytes back to these types.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  module Types

    # A string is type \x02 according to the specification.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    STRING = 2.chr.freeze
  end
end
