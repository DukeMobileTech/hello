# == Schema Information
#
# Table name: transcripts
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  language   :string
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Transcripts for post's video in different languages
class Transcript < ApplicationRecord
  belongs_to :post
end
