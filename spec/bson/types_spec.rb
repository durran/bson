require "spec_helper"

describe BSON::Types do

  describe "::STRING" do

    it "returns 0x02" do
      expect(BSON::Types::STRING).to eq(2.chr)
    end
  end
end
