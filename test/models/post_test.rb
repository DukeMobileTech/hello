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
#  video_data            :text
#  subtitle_data         :text
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
