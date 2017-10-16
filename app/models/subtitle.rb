# == Schema Information
#
# Table name: subtitles
#
#  id            :integer          not null, primary key
#  post_id       :integer
#  language      :string
#  subtitle_data :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Subtitle < ApplicationRecord
  belongs_to :post, touch: true
  include SubtitleUploader::Attachment.new(:subtitle)
  validates :language, uniqueness: true
end
