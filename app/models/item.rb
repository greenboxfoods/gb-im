# == Schema Information
#
# Table name: items
#
#  id                :integer          not null, primary key
#  name              :text
#  description       :text
#  vendor_name       :string
#  quantity          :integer
#  unit_value        :decimal(, )
#  value             :decimal(, )
#  picture           :string
#  category          :text
#  created_at        :datetime
#  updated_at        :datetime
#  unit_type         :string
#  brand_name        :string
#  location_id       :integer
#  restock_lead_time :time
#  payment_terms     :string
#  spoilage_date     :datetime
#  cooked            :boolean
#

class Item < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  # attr_accessible :description, :name, :picture, :quantity, :unit_value, :vendor_url, :value,
  #                 :vendor_name, :category, :unit_type, :brand_name, :location_id, :restock_lead_time,
  #                 :payment_terms, :spoilage_date, :cooked, :note



  self.per_page = 25

  belongs_to :item
  after_save :update_value

  acts_as_commentable

  def self.search(search)
    if search
      where('name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
    else
      where(nil)
    end
  end

protected

  def update_value
   update_column :value, (quantity * unit_value)
  end
end
