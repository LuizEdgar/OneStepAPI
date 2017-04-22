# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string           not null
#  kind       :integer          default("other")
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phone < ApplicationRecord
  belongs_to :user, required: false

  enum kind: { other: 0, mobile: 1, work: 2, home: 3, fax: 4}
end
