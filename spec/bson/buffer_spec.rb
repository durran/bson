require "spec_helper"

describe BSON::Buffer do

  shared_examples_for "a fluid interface" do

    it "returns the buffer instance" do
      expect(written).to eq(buffer)
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
      buffer.write_byte(BSON::Types::STRING)
    end

    it "writes the byte to the buffer" do
      expect(buffer.bytes).to eq(BSON::Types::STRING)
    end

    it_behaves_like "a fluid interface"
  end

  pending "#write_cstring"
  pending "#write_int32"
  pending "#write_string"
end
