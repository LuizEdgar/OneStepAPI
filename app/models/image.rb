# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  solo              :boolean          default(FALSE)
#  imageable_type    :string
#  imageable_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class Image < ApplicationRecord
  attr_accessor :base_64_file

  before_save :decode_base_64_file, if: "base_64_file.present?"
  belongs_to :imageable, polymorphic: true

  def decode_base_64_file
    image = Paperclip.io_adapters.for(base_64_file[:base64])
    image.original_filename = base_64_file[:filename]
    self.file = image
  end

  Paperclip.interpolates :imageable do |attachment, style|
    "#{attachment.instance.imageable_type.downcase}/#{attachment.instance.imageable_id}"
  end

  has_attached_file :file, 
    url: "/assets/images/:imageable/:style/:basename.png",
    path: "/assets/images/:imageable/:style/:basename.png"

  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
end
