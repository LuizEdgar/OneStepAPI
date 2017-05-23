# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Skill < ApplicationRecord
  attr_accessor :image_64
  before_save :update_image, if: "image_64.present?"

  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :volunteers

  belongs_to :image, class_name: "Image", optional: true, dependent: :destroy

  private

  def update_image
    file = { base64: image_64, filename: SecureRandom.urlsafe_base64}
    if self.image.nil?
      self.image = Image.new(base_64_file: file, imageable: self)
    else
      self.image.update_attributes(base_64_file: file)
    end
    self.image_64 = nil
  end

end
