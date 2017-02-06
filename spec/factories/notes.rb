# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  body         :text
#  notable_id   :integer
#  notable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :note do
    body "MyText"
    notable nil
  end
end
