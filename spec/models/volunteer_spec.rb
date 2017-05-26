# == Schema Information
#
# Table name: volunteers
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  birth_at            :date
#  about               :text
#  occupation          :string
#  gender              :integer          default("other")
#  period_availability :integer
#  volunteered         :boolean
#  cpf                 :string
#  rg                  :string
#  verified            :boolean          default(FALSE)
#  user_id             :integer
#  profile_image_id    :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
