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
#

class Opportunity < ApplicationRecord
  belongs_to :opportunitable, polymorphic: true

  has_one :location, as: :localizable, dependent: :destroy
  accepts_nested_attributes_for :location

  has_one :contact, as: :contactable, dependent: :destroy
  accepts_nested_attributes_for :contact

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :causes
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
