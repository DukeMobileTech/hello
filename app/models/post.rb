# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  category_id :integer
#  video_meta  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  video_data  :text
#

# Post with video
# Need to install ffmpeg inorder for video upload to work
# Use buildpacks in Heroku to install ffmpeg
class Post < ApplicationRecord
  include VideoUploader::Attachment.new(:video)
  default_scope { order(updated_at: :desc) }
  belongs_to :category, touch: true
  has_many :transcripts, dependent: :destroy
  has_many :translations, dependent: :destroy
  has_many :subtitles, dependent: :destroy

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
