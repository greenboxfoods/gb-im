class ChangeItemColumns < ActiveRecord::Migration
  def change
    remove_column :items, :product_model_number
    remove_column :items, :vendor_part_number
    remove_column :items, :vendor_url
    remove_column :items, :location

    add_column :items, :unit_type, :string
    add_column :items, :brand_name, :string
    add_column :items, :location_id, :integer
    add_column :items, :restock_lead_time, :time
    add_column :items, :payment_terms, :string
    add_column :items, :spoilage_date, :datetime



  end
end
