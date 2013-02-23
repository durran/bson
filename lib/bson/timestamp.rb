# encoding: utf-8
module BSON

  # Represents a timestamp type, which is predominately used for sharding.
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  class Timestamp

    # A timestamp is type 0x11 in the BSON spec.
    #
    # @since 2.0.0
    BSON_TYPE = 17.chr.freeze

    # @!attribute increment
    #   @return [ Integer ] The incrementing value.
    #   @since 2.0.0
    #
    # @!attribute seconds
    #   @return [ Integer ] The number of seconds.
    #   @since 2.0.0
    attr_reader :increment, :seconds

    # Encode the timestamp to its raw BSON bytes and append it to the provided
    # outbound raw bytes string.
    #
    # @example Encode the timestamp
    #   timestamp.__bson_encode__("key", buffer)
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
        write_timestamp(self)
    end

    # Instantiate the new timestamp.
    #
    # @example Instantiate the timestamp.
    #   BSON::Timestamp.new(5, 30)
    #
    # @param [ Integer ] increment The increment value.
    # @param [ Integer ] seconds The number of seconds.
    #
    # @since 2.0.0
    def initialize(increment, seconds)
      @increment, @seconds = increment, seconds
    end
  end
end
