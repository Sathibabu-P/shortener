class AddImpressionableCountToLink < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :impressionable_count, :integer
  end
end
