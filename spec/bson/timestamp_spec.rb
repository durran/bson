require "spec_helper"

describe BSON::Timestamp do

  describe "::BSON_TYPE" do

    it "returns 0x11" do
      expect(BSON::Timestamp::BSON_TYPE).to eq(17.chr)
    end
  end

  describe "#__bson_encode__" do

    let(:timestamp) do
      described_class.new(1, 10)
    end

    let(:buffer) do
      BSON::Buffer.new
    end

    let(:encoded) do
      timestamp.__bson_encode__("key", buffer)
    end

    let(:packed_timestamp) do
      [ 1, 10 ].pack("l2")
    end

    it "returns the buffer" do
      expect(encoded).to eq(buffer)
    end

    it "returns the same buffer instance" do
      expect(encoded).to eql(buffer)
    end

    it "encodes the field/timestamp pair to the buffer" do
      expect(encoded.bytes).to eq(
        "#{BSON::Timestamp::BSON_TYPE}key\x00#{packed_timestamp}"
      )
    end
  end
end
