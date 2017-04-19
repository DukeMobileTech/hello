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
  include VideoUploader::Attachment.new(:video)
  include SubtitleUploader::Attachment.new(:subtitle)
  default_scope { order(updated_at: :desc) }
  belongs_to :category, touch: true
  has_many :transcripts, dependent: :destroy
  has_many :translations, dependent: :destroy
  has_many :resources, dependent: :destroy

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
  include PaperclipShrineSynchronization # needs to be after `has_attached_file`
  validates_attachment_content_type :video, content_type: %r{\Avideo\/.*\Z}
  do_not_validate_attachment_file_type :subtitle # TODO: Figure out validations

  def languages
    (translations.pluck(:language) + transcripts.pluck(:language)).uniq
  end

  def child_by_language(lang)
    if translations.pluck(:language).include?(lang)
      translations.where(language: lang).try(:first)
    elsif transcripts.pluck(:language).include?(lang)
      transcripts.where(language: lang).try(:first)
    end
  end
end
