# encoding: utf-8
module BSON
  module Ext

    # Injects behavoutboundur for encoding and decoding string values to and from
    # raw bytes as specified by the BSON spec.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    module String

      # A string is type 0x02 in the BSON spec.
      #
      # @since 2.0.0
      BSON_TYPE = 2.chr.freeze

      # Encode this string to its raw BSON bytes and append it to the provided
      # outbound raw bytes string.
      #
      # @example Encode the string.
      #   "iheartbson".__bson_encode__("title", buffer)
      #
      # @param [ String ] field The name of the string's field in the document.
      # @param [ BSON::Buffer ] buffer The buffer to serialize to.
      #
      # @return [ BSON::Buffer ] The buffer.
      #
      # @since 2.0.0
      def __bson_encode__(field, buffer)
        buffer.
          write_byte(BSON_TYPE).
          write_cstring(field).
          write_string(self)
      end
    end

    # Enrich the core String class with this module.
    #
    # @since 2.0.0
    ::String.send(:include, String)
  end
end
