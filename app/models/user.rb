# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  facebook_id     :string
#  auth            :string           not null
#  password_digest :string           not null
#  kind            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_token :auth
  has_secure_password validations: false
  
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

  def contacts
    if kind == "volunteer"
      @contacts = volunteer.contacts
    else
      @contacts = organization.contacts
    end
  end

  def opportunities
    if kind == "volunteer"
      @opportunities = volunteer.opportunities
    else
      @opportunities = organization.opportunities
    end
  end

  def skills
    if kind == "volunteer"
      @skills = volunteer.skills
    else
      @skills = organization.skills
    end
  end

  def causes
    if kind == "volunteer"
      @causes = volunteer.causes
    else
      @causes = organization.causes
    end
  end

  def locations
    if kind == "volunteer"
      @locations = volunteer.locations
    else
      @locations = organization.locations
    end
  end

end
