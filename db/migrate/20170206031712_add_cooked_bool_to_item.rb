class AddCookedBoolToItem < ActiveRecord::Migration
  def change
    add_column :items, :cooked, :boolean
  end
end
