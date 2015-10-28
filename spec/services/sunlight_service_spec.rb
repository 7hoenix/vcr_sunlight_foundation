require "rails_helper"

RSpec.describe SunlightService do
  attr_reader :service

  before(:each) do
    @service ||= SunlightService.new
  end

  describe "#legislators" do
    it "returns a listing of female representatives" do
      VCR.use_cassette("sunlight_service#legislators gender") do
        legislators = service.legislators(gender: "F")
        legislator = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator[:first_name]).to eq("Joni")
        expect(legislator[:last_name]).to eq("Ernst")
      end
    end

    it "returns a listing of legislators in chamber" do
      VCR.use_cassette("sunlight_service#legislators chamber") do
        legislators = service.legislators(chamber: "senate")
        legislator = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator[:first_name]).to eq("Benjamin")
        expect(legislator[:last_name]).to eq("Sasse")
      end
    end
  end
end
