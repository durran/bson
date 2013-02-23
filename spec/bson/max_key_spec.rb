require "spec_helper"

describe BSON::MaxKey do

  describe "::BSON_TYPE" do

    it "returns 0x7F" do
      expect(BSON::MaxKey::BSON_TYPE).to eq(127.chr)
    end
  end

  describe "#__bson_encode__" do

    let(:max_key) do
      described_class.new
    end

    let(:buffer) do
      BSON::Buffer.new
    end

    let(:encoded) do
      max_key.__bson_encode__("key", buffer)
    end

    it "returns the buffer" do
      expect(encoded).to eq(buffer)
    end

    it "returns the same buffer instance" do
      expect(encoded).to eql(buffer)
    end

    it "encodes the field/max key pair to the buffer" do
      expect(encoded.bytes).to eq("#{BSON::MaxKey::BSON_TYPE}key\x00")
    end
  end
end
