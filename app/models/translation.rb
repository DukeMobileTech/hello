# == Schema Information
#
# Table name: translations
#
#  id         :integer          not null, primary key
#  title      :string
#  language   :string
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  audio_data :text
#

# Audio translation for post video attachment
class Translation < ApplicationRecord
  include AudioUploader::Attachment.new(:audio)
  belongs_to :post, touch: true
end
