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

class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true
end