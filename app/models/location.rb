# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  address_1        :string
#  address_2        :string
#  city             :string
#  state            :string
#  country          :string
#  postcode         :string
#  latitude         :decimal(15, 10)
#  longitude        :decimal(15, 10)
#  localizable_type :string
#  localizable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Location < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
end
