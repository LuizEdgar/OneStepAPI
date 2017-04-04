# == Schema Information
#
# Table name: educations
#
#  id           :integer          not null, primary key
#  degree       :string
#  field        :string
#  activities   :string
#  description  :string
#  volunteer_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Education < ApplicationRecord
  belongs_to :volunteer, required: false

end
