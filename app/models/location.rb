# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  address_1  :string
#  address_2  :string
#  city       :string
#  state      :string
#  country    :string
#  postcode   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
end
