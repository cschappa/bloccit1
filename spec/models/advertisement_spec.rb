require 'rails_helper'

RSpec.describe Advertisement, type: :model do

  let(:ad) {Advertisement.create!(title: "Test Title", body: "Test body", price: 199)}
  describe "attributes" do
    it "has title, body and price attributes" do
      expect(ad).to have_attributes(title: "Test Title", body: "Test body", price: 199)
    end
  end
end
