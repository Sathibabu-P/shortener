class Link < ApplicationRecord
  has_many :impressionists, as: :impressionable
  default_scope {where("expired_at > ?", Date.today)}
  HOST_URL= "http://localhost:3000"

  validates_presence_of :url,:short_code

  validate :isvalid?, if: :url


  # return short url append by host
  def short_url
    "#{HOST_URL}/#{short_code}"
  end

  def isvalid?
    uri  = URI.parse(url)
    errors.add(:url, 'Invalid url') if uri.host.nil?
  end

end
