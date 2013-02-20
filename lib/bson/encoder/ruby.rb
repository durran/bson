# encoding: utf-8
module BSON
  module Encoder

    # Provides pure ruby support for encoding in the wake of not being able to
    # load any native extensions in C or Java.
    #
    # @since 2.0.0
    module Ruby

      # Writes a raw string to the outbound bytes.
      #
      # @example Write a string to the bytes.
      #   BSON::Encoder::Ruby.write_string("name", "Sid", "")
      #
      # @param [ String ] field The name of the field.
      # @param [ String ] value The string to write.
      # @param [ String ] outbound The outbound raw bytes.
      #
      # @return [ String ] The encoded raw bytes.
      #
      # @since 2.0.0
      def write_string(field, value, outbound)
        # outbound << Types::STRING
        # outbound << field
        # outbound << [ value.bytesize + 1 ].pack(INT32_PACK)
        # outbound << value
        # outbound << NULL_BYTE
      end
    end
  end
end
