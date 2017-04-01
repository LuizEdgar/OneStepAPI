# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Skill < ApplicationRecord
  has_and_belongs_to_many :volunteers
end
