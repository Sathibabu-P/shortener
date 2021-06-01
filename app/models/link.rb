class Link < ApplicationRecord
  scope :active, -> { where("expired_at > ?", Date.today) }
end
