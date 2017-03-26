require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:name) { RandomData.random_sentance }
  let(:body) { RandomData.random_paragraph }
  let(:price) { 55 }
  let(:my_topic) { Topic.create!(name: name, body: body, price: price) }

  describe "attributes" do
    it "has title, body, and price attributes" do
      expect(my_topic).to have_attributes(name: name, body: body, price: price)
    end
  end
end
