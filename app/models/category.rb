# == Schema Information
#
# Table name: categories
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  pictogram_file_name    :string
#  pictogram_content_type :string
#  pictogram_file_size    :integer
#  pictogram_updated_at   :datetime
#

# Tab
class Category < ApplicationRecord
  has_many :posts
  has_many :translations, through: :posts
  has_many :documents
  has_attached_file :pictogram, styles: {
    medium: '300x300>',
    thumb: '100x100>'
  }
  validates_attachment_content_type :pictogram, content_type: %r{\Aimage\/.*\z}
  validates_attachment_file_name :pictogram, matches: [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, attributes: :pictogram, less_than: 5.megabytes
end
