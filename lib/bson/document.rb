# encoding: utf-8
require "bson/buffer"
require "bson/ext"

module BSON

  # This module provides behaviour for serializing and deserializing entire
  # BSON documents, according to the BSON specification.
  #
  # @note The specification is: document ::= int32 e_list "\x00"
  #
  # @see http://bsonspec.org/#/specification
  #
  # @since 2.0.0
  module Document
    extend self

    def deserialize(inbound)

    end

    # Serialize a document into a raw string of bytes.
    #
    # @example Serialize the document into it's raw bytes.
    #   BSON::Document.serialize({ :name => "Sid Vicious" })
    #
    # @param [ Hash ] document The document to serialize.
    # @param [ BSON::Buffer ] buffer The buffer to write to. (optional)
    #
    # @return [ BSON::Buffer ] The buffer.
    #
    # @since 2.0.0
    def serialize(document, buffer = Buffer.new)
      # document.each do |field, value|
        # value.__bson_encode__(field, buffer)
      # end
      # buffer
    end
  end
end
