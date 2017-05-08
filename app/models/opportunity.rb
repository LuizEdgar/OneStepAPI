# == Schema Information
#
# Table name: oppotunities
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

class Opportunity < ApplicationRecord
  belongs_to :opportunitable, polymorphic: true

  has_many :locations, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_many :contacts, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes
end
