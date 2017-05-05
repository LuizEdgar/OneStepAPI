# == Schema Information
#
# Table name: contacts
#
#  id               :integer          not null, primary key
#  name             :string
#  phone            :string
#  email            :string
#  contactable_type :string
#  contactable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
end
