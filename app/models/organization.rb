# == Schema Information
#
# Table name: organizations
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  cnpj             :string
#  site             :string
#  about            :text
#  mission          :text
#  size             :integer
#  verified         :boolean          default(FALSE)
#  established_at   :date
#  user_id          :integer
#  profile_image_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Organization < ApplicationRecord
  attr_accessor :profile_image_64, :images_attributes_64
  before_validation :update_profile_image, if: "profile_image_64.present?"
  before_save :add_images, if: "images_attributes_64.present?"
  after_create :create_feed_item
  after_update :update_feed_item

  belongs_to :user, required: false
  
  has_many :locations, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_many :contacts, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true

  has_many :opportunities, as: :opportunitable, dependent: :destroy

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

  belongs_to :profile_image, class_name: "Image", optional: true, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_one :feed_item, as: :feedable, dependent: :destroy

  private

  def update_profile_image
    file = { base64: profile_image_64, filename: SecureRandom.urlsafe_base64}
    if self.profile_image.nil?
      self.profile_image = Image.new(base_64_file: file, imageable: self)
    else
      self.profile_image.update_attributes(base_64_file: file)
    end
    self.profile_image_64 = nil
  end

  def add_images
    self.images_attributes_64.each do |image_64|
      file = { base64: image_64, filename: SecureRandom.urlsafe_base64}
      image = Image.new(base_64_file: file, imageable: self)
      self.images << image
    end
  end

  def create_feed_item
    FeedItem.create(feedable: self)
  end

  def update_feed_item
    if self.updated_at_changed?
      if self.feed_item.nil?
        self.create_feed_item
      end
      self.feed_item.touch
    end
  end

end
