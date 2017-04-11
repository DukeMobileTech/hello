# == Schema Information
#
# Table name: posts
#
#  id                    :integer          not null, primary key
#  title                 :string
#  category_id           :integer
#  video_meta            :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  video_file_name       :string
#  video_content_type    :string
#  video_file_size       :integer
#  video_updated_at      :datetime
#  subtitle_file_name    :string
#  subtitle_content_type :string
#  subtitle_file_size    :integer
#  subtitle_updated_at   :datetime
#

# Post with video
# Need to install ffmpeg inorder for video upload to work
# Use buildpacks in Heroku to install ffmpeg
class Post < ApplicationRecord
  belongs_to :category
  has_many :transcripts
  has_many :translations
  has_attached_file :video, styles: {
    medium: {
      geometry: '640x480',
      format: 'mp4'
    },
    thumb: {
      geometry: '100x100#',
      format: 'jpg',
      time: 10
    }
  }, processors: [:transcoder]
  has_attached_file :subtitle
  validates_attachment_content_type :video, content_type: %r{\Avideo\/.*\Z}
  do_not_validate_attachment_file_type :subtitle # TODO: Figure out validations

  def languages
    (translations.pluck(:language) + transcripts.pluck(:language)).uniq
  end
end
