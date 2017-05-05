class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
end
