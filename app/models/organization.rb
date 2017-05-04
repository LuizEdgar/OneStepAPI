# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  cnpj           :string
#  site           :string
#  about          :string
#  requirements   :string
#  goal           :string
#  need           :string
#  size           :integer
#  established_at :date
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Organization < ApplicationRecord
  belongs_to :user, required: false
  has_many :phones, through: :user, source: :phones
  has_many :locations, through: :user, source: :locations

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

end