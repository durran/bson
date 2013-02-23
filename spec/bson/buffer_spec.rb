require "spec_helper"

describe BSON::Buffer do

  shared_examples_for "a fluid interface" do

    it "returns a buffer instance" do
      expect(written).to eq(buffer)
    end

    it "returns the same buffer instance" do
      expect(written).to eql(buffer)
    end
  end

  describe "#initialize" do

    context "when providing bytes" do

      let(:buffer) do
        described_class.new("test")
      end

      it "sets the provided bytes" do
        expect(buffer.bytes).to eq("test")
      end
    end

    context "when providing no bytes" do

      let(:buffer) do
        described_class.new
      end

      it "sets the bytes to empty" do
        expect(buffer.bytes).to be_empty
      end
    end
  end

  describe "#write_byte" do

    let(:buffer) do
      described_class.new
    end

    let!(:written) do
      buffer.write_byte(String::BSON_TYPE)
    end

    it "writes the byte to the buffer" do
      expect(buffer.bytes).to eq(String::BSON_TYPE)
    end

    it_behaves_like "a fluid interface"
  end

  describe "#write_cstring" do

    let(:buffer) do
      described_class.new
    end

    let!(:written) do
      buffer.write_cstring("test")
    end

    it "writes the cstring to the buffer" do
      expect(buffer.bytes).to eq("test\x00")
    end

    it_behaves_like "a fluid interface"
  end

  describe "#write_int32" do

    let(:buffer) do
      described_class.new
    end

    let!(:written) do
      buffer.write_int32(4)
    end

    it "writes the integer to the buffer" do
      expect(buffer.bytes).to eq("\x04\x00\x00\x00")
    end

    it_behaves_like "a fluid interface"
  end

  describe "#write_string" do

    let(:buffer) do
      described_class.new
    end

    let!(:written) do
      buffer.write_string("test")
    end

    it "writes the string to the buffer" do
      expect(buffer.bytes).to eq("\x05\x00\x00\x00test\x00")
    end

    it_behaves_like "a fluid interface"
  end
end
