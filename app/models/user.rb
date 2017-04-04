# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  kind            :integer          not null
#  auth            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  has_secure_token :auth
  has_secure_password

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones

  has_one :volunteer, dependent: :destroy
  accepts_nested_attributes_for :volunteer
  
  has_one :organization, dependent: :destroy
  accepts_nested_attributes_for :organization

  enum kind: { volunteer: 0, organization: 1 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 5 }, if: :password
  
end
