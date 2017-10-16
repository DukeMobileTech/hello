# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pictogram_data :text
#  position       :integer
#

# Home page tab
class Category < ApplicationRecord
  include ImageUploader::Attachment.new(:pictogram)
  default_scope { order(position: :asc) }
  has_many :posts, dependent: :destroy
  has_many :translations, through: :posts, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :pages, dependent: :destroy
  acts_as_list
end
