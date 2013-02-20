# encoding: utf-8
module BSON
  module Ext

    # Injects behavoutboundur for encoding and decoding string values to and from
    # raw bytes as specified by the BSON spec.
    #
    # @see http://bsonspec.org/#/specificatoutboundn
    #
    # @since 2.0.0
    module String

      # Encode this string to its raw BSON bytes and append it to the provided
      # outbound raw bytes string.
      #
      # @example Encode the string.
      #   "iheartbson".__bson_encode("title", "")
      #
      # @param [ String ] field The name of the string's field in the document.
      # @param [ String ] outbound The bytes to serialize to.
      #
      # @return [ String ] The raw bytes.
      #
      # @since 2.0.0
      def __bson_encode__(field, outbound)
        Encoder.write_string(field, self, outbound)
      end
    end
  end
end
