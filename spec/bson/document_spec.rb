require "spec_helper"

describe BSON::Document do

  describe ".serialize" do

    context "when provided a hash" do

      context "when the hash is all valid types" do

        let(:document) do
          { "key" => "value" }
        end

        let(:serialized) do
          described_class.serialize(document)
        end

        it "returns a buffer" do
          expect(serialized).to be_a(BSON::Buffer)
        end

        it "serializes the document" do
          expect(serialized.bytes).to eq("\x02key\x00\x06\x00\x00\x00value\x00")
        end
      end
    end
  end
end
