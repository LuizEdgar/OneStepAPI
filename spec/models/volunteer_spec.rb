# == Schema Information
#
# Table name: volunteers
#
#  id                  :integer          not null, primary key
#  birth_at            :date
#  about               :string
#  gender              :integer
#  day_availability    :integer
#  period_availability :integer
#  volunteered         :boolean
#  cpf                 :string
#  rg                  :string
#  verified            :boolean          default(FALSE)
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
