class CreateImpressionists < ActiveRecord::Migration[6.1]
  def change
    create_table :impressionists do |t|
      t.string   "impressionable_type"  
      t.integer  "impressionable_id"    
      t.string   "ip_address"           
      t.string   "country"               
      t.text     "request_hash"             
      t.timestamps
    end
    add_index "impressionists", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    add_index "impressionists", ["impressionable_type", "impressionable_id", "country"], name: "poly_country_index", using: :btree
  end
end
