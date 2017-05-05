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

require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
