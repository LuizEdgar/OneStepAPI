# == Schema Information
#
# Table name: opportunities
#
#  id                  :integer          not null, primary key
#  title               :string
#  volunteers_number   :integer
#  is_virtual          :boolean
#  is_ongoing          :boolean
#  start_at            :datetime
#  end_at              :datetime
#  start_date_set      :boolean
#  end_date_set        :boolean
#  start_time_set      :boolean
#  end_time_set        :boolean
#  description         :text
#  time_commitment     :string
#  others_requirements :string
#  tags                :string
#  opportunitable_type :string
#  opportunitable_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Opportunity < ApplicationRecord
  attr_accessor :images_attributes_64
  before_save :add_images, if: "images_attributes_64.present?"
  after_create :create_feed_item
  after_update :update_feed_item

  belongs_to :opportunitable, polymorphic: true

  has_one :location, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :location, allow_destroy: true

  has_one :contact, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contact, allow_destroy: true

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_one :feed_item, as: :feedable, dependent: :destroy

  private

  def add_images
    self.images_attributes_64.each do |image_64|
      file = { base64: image_64, filename: SecureRandom.urlsafe_base64}
      image = Image.new(base_64_file: file, imageable: self)
      self.images << image
    end
  end

  def update_feed_item
    if self.updated_at_changed?
      if self.feed_item.nil?
        self.create_feed_item
      end
      self.feed_item.touch
    end
  end

  def create_feed_item
    FeedItem.create(feedable: self)
  end
  
end

#  Opportunity Load (0.6ms)  SELECT "opportunities".* FROM "opportunities"
# DEPRECATION WARNING: Time columns will become time zone aware in Rails 5.1. This
# still causes `String`s to be parsed as if they were in `Time.zone`,
# and `Time`s to be converted to `Time.zone`.

# To keep the old behavior, you must add the following to your initializer:

#     config.active_record.time_zone_aware_types = [:datetime]

# To silence this deprecation warning, add the following:

#     config.active_record.time_zone_aware_types = [:datetime, :time]
#  (called from <top (required)> at /Users/luizfreitas/Documents/Projects/SerVoluntario/SerVoluntarioAPI/bin/rails:9)
# DEPRECATION WARNING: Time columns will become time zone aware in Rails 5.1. This
# still causes `String`s to be parsed as if they were in `Time.zone`,
# and `Time`s to be converted to `Time.zone`.

# To keep the old behavior, you must add the following to your initializer:

#     config.active_record.time_zone_aware_types = [:datetime]

# To silence this deprecation warning, add the following:

#     config.active_record.time_zone_aware_types = [:datetime, :time]
#  (called from <top (required)> at /Users/luizfreitas/Documents/Projects/SerVoluntario/SerVoluntarioAPI/bin/rails:9)
