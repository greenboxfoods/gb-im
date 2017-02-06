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
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
