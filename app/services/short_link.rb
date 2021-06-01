class ShortLink

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def generate
    Link.create({url: url, short_code: secure_short_code, expired_at: Date.today + 1.month})
  end

  private

  def secure_short_code
    SecureRandom.uuid[0..4]
  end

end