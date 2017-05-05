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

  has_many :locations, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_many :contacts, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

  enum gender: {other: 0, male: 1, female: 2}
end