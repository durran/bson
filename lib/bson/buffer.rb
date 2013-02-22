# encoding: utf-8
module BSON

  # This class provides behavior for encoding and decoding specific values to
  # a stream. Depending on the environment, the appropriate c or java
  # implementation will be used, or the native ruby one.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  class Buffer

    # Constant for a string with binary encoding.
    #
    # @since 2.0.0
    BINARY = "BINARY".freeze

    # Constant for the int 32 pack directive.
    #
    # @since 2.0.0
    INT32_PACK = "l".freeze

    # Constant for the timestamp pack directive.
    #
    # @since 2.0.0
    TIMESTAMP_PACK = "l2".freeze

    # Constant for a null byte (0x00).
    #
    # @since 2.0.0
    NULL_BYTE = 0.chr.freeze

    # @!attribute bytes
    #   @return [ String ] The raw bytes in the buffer.
    #   @since 2.0.0
    attr_reader :bytes

    # Initialize the buffer.
    #
    # @example Initialize the buffer with bytes.
    #   BSON::Buffer.new("")
    #
    # @example Initialize the buffer with no args.
    #   BSON::Buffer.new
    #
    # @param [ String ] bytes Raw bytes to start with.
    #
    # @since 2.0.0
    def initialize(bytes = nil)
      @bytes = bytes || "".force_encoding(BINARY)
    end

    # Write a single byte to the buffer, usually for specifying a type.
    #
    # @example Write a single byte.
    #   buffer.write_byte("\x00")
    #
    # @param [ String ] value The single byte string.
    #
    # @return [ BSON::Buffer ] The buffer instance.
    #
    # @since 2.0.0
    def write_byte(value)
      bytes << value and self
    end

    # Write a cstring to the buffer.
    #
    # @example Write a cstring to the buffer.
    #   buffer.write_cstring("testing")
    #
    # @note The specification is: cstring ::= (byte*) "\x00"
    #
    # @param [ String ] value The value to write.
    #
    # @return [ BSON::Buffer ] The buffer instance.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def write_cstring(value)
      bytes << value
      bytes << NULL_BYTE and self
    end

    # Write a 4 byte integer to the buffer.
    #
    # @example Write the integer to the buffer.
    #   buffer.write_int32(100)
    #
    # @param [ Integer ] value The integer to write.
    #
    # @return [ BSON::Buffer ] The buffer instance.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def write_int32(value)
      bytes << (value & 255) << ((value >> 8) & 255) << ((value >> 16) & 255) << (( value >> 24) & 255)
      self
      # bytes << [ value ].pack(INT32_PACK) and self
    end

    # Write a string to the buffer.
    #
    # @example Write a string to the buffer.
    #   buffer.write_string("test")
    #
    # @note The specification is: string ::= int32 (byte*) "\x00"
    #
    # @param [ String ] value The string to write.
    #
    # @return [ BSON::Buffer ] The buffer instance.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def write_string(value)
      write_int32(value.bytesize + 1)
      bytes << value
      bytes << NULL_BYTE and self
    end

    # Write a timestamp to the buffer.
    #
    # @example Write a timestamp to the buffer.
    #   buffer.write_timestamp(timestamp)
    #
    # @note The specification is: timestamp ::= "\x11" e_name int64
    #
    # @param [ BSON::Timestamp ] value The timestamp value.
    #
    # @return [ BSON::Buffer ] The buffer instance.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    def write_timestamp(value)
      bytes << [ value.increment, value.seconds ].pack(TIMESTAMP_PACK) and self
    end
  end
end
