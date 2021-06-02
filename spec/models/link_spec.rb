require 'rails_helper'

RSpec.describe Link, type: :model do

  HOST_URL= "http://localhost:3000"

  describe "validations" do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:short_code) }
  end

  describe "associations" do
    it { should have_many(:impressionists) }
  end

  describe "#short_url" do
    let(:link) { build :link, short_code: "aw342", expired_at: Date.today+1.month }
    it "returns short_url" do
      expect(link.short_url).to eq("#{HOST_URL}/#{link.short_code}")
    end
  end

  describe "#isvalid?" do
    let(:link) { build :link, url: "invali", short_code: "aw342", expired_at: Date.today+1.month }
    it "is invalid if url is not valid url" do
      expect(link.valid?).to be(false)
    end
  end
  
  
end
