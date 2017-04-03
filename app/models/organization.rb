class Organization < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :skills_needed, class_name: 'Skill'
  has_and_belongs_to_many :causes
end
