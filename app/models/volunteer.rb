# == Schema Information
#
# Table name: volunteers
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  birth_at            :date
#  about               :text
#  occupation          :string
#  gender              :integer          default("other")
#  period_availability :integer
#  volunteered         :boolean
#  cpf                 :string
#  rg                  :string
#  verified            :boolean          default(FALSE)
#  user_id             :integer
#  profile_image_id    :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Volunteer < ApplicationRecord
  attr_accessor :profile_image_64
  before_validation :update_profile_image, if: "profile_image_64.present?"

  belongs_to :user, required: false

  has_many :locations, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_many :contacts, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true

  has_many :opportunities, as: :opportunitable, dependent: :destroy

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

  belongs_to :profile_image, class_name: "Image", optional: true, dependent: :destroy

  enum gender: {other: 0, male: 1, female: 2}

  private

  def update_profile_image
    file = { base64: profile_image_64, filename: "profile"}
    if self.profile_image.nil?
      self.profile_image = Image.new(base_64_file: file, imageable: self, solo: true)
    else
      self.profile_image.update_attributes(base_64_file: file)
    end
    self.profile_image_64 = nil
  end

end
