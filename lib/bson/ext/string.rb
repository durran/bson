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

      # Encode this string to its raw BSON bytes and append it to the provided
      # outbound raw bytes string.
      #
      # @example Encode the string.
      #   "iheartbson".__bson_encode__("title", "")
      #
      # @param [ String ] field The name of the string's field in the document.
      # @param [ Buffer ] buffer The buffer to serialize to.
      #
      # @return [ Buffer ] The buffer.
      #
      # @since 2.0.0
      def __bson_encode__(field, buffer)
        buffer.
          write_byte(Types::STRING).
          write_cstring(field).
          write_string(self)
      end
    end

    # Enrich the core String class with this module.
    ::String.send(:include, String)
  end
end
