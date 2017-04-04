# == Schema Information
#
# Table name: causes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cause < ApplicationRecord
  has_and_belongs_to_many :organizations
end
