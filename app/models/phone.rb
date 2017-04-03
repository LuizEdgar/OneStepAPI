# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string
#  type       :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phone < ApplicationRecord
  belongs_to :user

  enum type: { other: 0, mobile: 1, work: 2, home: 3, fax: 4 }
end
