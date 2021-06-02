require 'rails_helper'

RSpec.describe ShortLink do
 
  let(:url1) {  Faker::Internet.domain_name}
  let(:url2) {  Faker::Internet.domain_name}
  

  it "creates a link with uniq random short code " do
    link = ShortLink.new(url1).generate
    expect(link).not_to be_nil
  end

  it "creates links with uniq short codes" do
    link1 = ShortLink.new(url1).generate
    link2 = ShortLink.new(url1).generate
    expect(link1.short_code).not_to eq(link2.short_code)
  end
  
end