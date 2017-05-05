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
  
  has_many :locations, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_many :contacts, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes
end