# encoding: utf-8
require "bson/element"
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

    # Serialize a document into a raw string of bytes.
    #
    # @example Serialize the document into it's raw bytes.
    #   BSON::Document.serialize({ :name => "Sid Vicious" })
    #
    # @param [ Hash ] document The document to serialize.
    #
    # @return [ String ] The raw bytes.
    #
    # @since 2.0.0
    def serialize(document)
      buffer = "".force_encoding("BINARY")
      document.each do |field, value|
        buffer << Element.new(field, value).to_bson
      end
      buffer
    end
  end
end
