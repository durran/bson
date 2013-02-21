require "spec_helper"

describe BSON::Types do

  describe ".get" do

    context "when the type has a correspoding class" do

      let(:klass) do
        described_class.get(BSON::Types::MIN_KEY)
      end

      it "returns the class" do
        expect(klass).to eq(BSON::MinKey)
      end
    end

    context "when the type has no corresponding class" do

      it "raises an error" do
        expect {
          described_class.get("test")
        }.to raise_error(KeyError)
      end
    end
  end

  describe "::MAX_KEY" do

    it "returns 0x7F" do
      expect(BSON::Types::MAX_KEY).to eq(127.chr)
    end
  end

  describe "::MIN_KEY" do

    it "returns 0xFF" do
      expect(BSON::Types::MIN_KEY).to eq(255.chr)
    end
  end

  describe "::STRING" do

    it "returns 0x02" do
      expect(BSON::Types::STRING).to eq(2.chr)
    end
  end
end
