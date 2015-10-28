require "rails_helper"

RSpec.describe Committee do
  describe "#find_by" do
    it "finds committees by chamber type" do
      VCR.use_cassette("committees#find_by chamber") do
        committees = Committee.find_by(chamber: "joint")
        committee = committees.first

        expect(committees.count).to eq(5)
        expect(committee.class).to eq(Committee)
        expect(committee.name).to eq("Joint Committee on Taxation")
        expect(committee.subcommittee).to eq(false)
      end
    end

    it "finds committees by query" do
      VCR.use_cassette("committees#find_by query") do
        committees = Committee.find_by(query: "taxation")
        committee = committees.first

        expect(committees.count).to eq(2)
        expect(committee.class).to eq(Committee)
        expect(committee.name).to eq("Taxation and IRS Oversight")
        expect(committee.subcommittee).to eq(true)
      end
    end
  end
end
