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

class Volunteer < ApplicationRecord
  belongs_to :user, required: false
  has_many :phones, through: :user, source: :phones
  has_many :locations, through: :user, source: :locations

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

  enum gender: {other: 0, male: 1, female: 2}
end