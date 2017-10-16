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

require 'test_helper'

class SubtitleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
