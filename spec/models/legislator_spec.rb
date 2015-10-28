require "rails_helper"

RSpec.describe Legislator do
  describe "#find_by" do
    it "finds legislators by credentials" do
      VCR.use_cassette("legislator#find_by gender") do
        legislators = Legislator.find_by(gender: "F")
        legislator = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator.class).to eq(Legislator)
        expect(legislator.first_name).to eq("Joni")
        expect(legislator.last_name).to eq("Ernst")
      end
    end

    it "returns a listing of legislators by chamber" do
      VCR.use_cassette("legislator#find_by chamber") do
        legislators = Legislator.find_by(chamber: "senate")
        legislator = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator.class).to eq(Legislator)
        expect(legislator.first_name).to eq("Benjamin")
        expect(legislator.last_name).to eq("Sasse")
      end
    end
  end
end
