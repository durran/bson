require "spec_helper"

describe BSON::Document do

  pending ".deserialize"

  describe ".serialize" do

    context "when provided a hash" do

      context "when the hash is all valid types" do

        pending "it serializes the document"
      end

      context "when the hash has invalid types" do

        pending "it raises an error"
      end

      context "when the hash contains invalid keys" do

        pending "it raises an error"
      end

      context "when the hash has invalid values" do

        pending "it raises an error"
      end
    end

    context "when not providing a hash" do

      pending "it raises an error"
    end
  end
end
