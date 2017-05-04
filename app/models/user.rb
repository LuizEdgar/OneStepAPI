# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string
#  facebook_id     :string
#  kind            :integer          not null
#  auth            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  has_secure_token :auth
  has_secure_password validations: false

  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  has_one :volunteer, dependent: :destroy
  accepts_nested_attributes_for :volunteer
  
  has_one :organization, dependent: :destroy
  accepts_nested_attributes_for :organization

  enum kind: { volunteer: 0, organization: 1 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\Z/

  validates :username, length: (3..18), presence: true, uniqueness: true, format: { with: VALID_USERNAME_REGEX }
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: (6..32), confirmation: true, if: :password
  validates :facebook_id, uniqueness: true, allow_nil: true

  def self.find_by_facebook_token(facebook_token)
    graph = Koala::Facebook::API.new(facebook_token)
    @user = User.find_by_facebook_id(graph.get_object('me')["id"])
  end

end