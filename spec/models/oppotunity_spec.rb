# == Schema Information
#
# Table name: opportunities
#
#  id                  :integer          not null, primary key
#  title               :string
#  volunteers_number   :integer
#  description         :text
#  time_commitment     :string
#  requirements        :string
#  opportunitable_type :string
#  opportunitable_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
