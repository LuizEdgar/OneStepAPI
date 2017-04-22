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

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  has_one :volunteer, dependent: :destroy
  accepts_nested_attributes_for :volunteer
  
  has_one :organization, dependent: :destroy
  accepts_nested_attributes_for :organization

  enum kind: { volunteer: 0, organization: 1 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, if: Proc.new{|user| user.facebook_id.blank? }
  validates :password, length: (6..32), confirmation: true, if: Proc.new{|user| user.facebook_id.blank? }
  validates :facebook_id, uniqueness: true, if: Proc.new{|user| user.email.blank? && user.password.blank? && user.facebook_id.present? }

  def self.find_by_facebook_token(facebook_token)
    graph = Koala::Facebook::API.new(facebook_token)
    @user = User.find_by_facebook_id(graph.get_object('me')["id"])
  end

end
