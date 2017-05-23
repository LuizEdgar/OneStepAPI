# == Schema Information
#
# Table name: opportunities
#
#  id                  :integer          not null, primary key
#  title               :string
#  is_ongoing          :boolean
#  is_virtual          :boolean
#  volunteers_number   :integer
#  start_date_at       :date
#  end_date_at         :date
#  start_time_at       :time
#  end_time_at         :time
#  description         :text
#  time_commitment     :string
#  others_requirements  :string
#  tags                :string
#  opportunitable_type :string
#  opportunitable_id   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null

class Opportunity < ApplicationRecord
  attr_accessor :images_attributes_64
  before_save :add_images, if: "images_attributes_64.present?"

  belongs_to :opportunitable, polymorphic: true

  has_one :location, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :location, allow_destroy: true

  has_one :contact, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contact, allow_destroy: true

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  private

  def add_images
    self.images_attributes_64.each do |image_64|
      file = { base64: image_64, filename: SecureRandom.urlsafe_base64}
      image = Image.new(base_64_file: file, imageable: self)
      self.images << image
    end
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
