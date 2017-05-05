# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  cnpj           :string
#  site           :string
#  about          :string
#  mission        :string
#  size           :integer
#  verified       :boolean          default(FALSE)
#  established_at :date
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Organization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
