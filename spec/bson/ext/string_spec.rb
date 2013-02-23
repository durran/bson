require "spec_helper"

describe BSON::Ext::String do

  describe "::BSON_TYPE" do

    it "returns 0x02" do
      expect(String::BSON_TYPE).to eq(2.chr)
    end
  end

  describe "#__bson_encode__" do

    let(:string) do
      "test"
    end

    let(:buffer) do
      BSON::Buffer.new
    end

    let(:encoded) do
      string.__bson_encode__("key", buffer)
    end

    it "returns the buffer" do
      expect(encoded).to eq(buffer)
    end

    it "returns the same buffer instance" do
      expect(encoded).to eql(buffer)
    end

    it "encodes the field/string pair to the buffer" do
      expect(encoded.bytes).to eq("\x02key\x00\x05\x00\x00\x00test\x00")
    end
  end
end
