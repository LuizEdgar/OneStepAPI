# == Schema Information
#
# Table name: feed_items
#
#  id            :integer          not null, primary key
#  feedable_type :string
#  feedable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FeedItem < ApplicationRecord
  belongs_to :feedable, polymorphic: true
end
