class ShortLink

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def generate
    Link.create({url: url, short_code: short_code, expired_at: Date.today + 1.month})
  end

  def short_code
    loop do
      code = secure_random_code
      break code unless Link.exists?(short_code: code) #check already code exists
    end
  end

  private

  def secure_random_code
    SecureRandom.uuid[0..4]
  end

end