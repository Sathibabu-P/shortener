class Impressionist < ApplicationRecord
  belongs_to :impressionable, polymorphic: true, counter_cache: :impressionable_count
  scope :group_by_country_count, -> { group(:country).order(:count).count }

  def self.top_countries #get all most viewed countries
    group_by_country_count.keys.compact.join("")
  end
  
end
