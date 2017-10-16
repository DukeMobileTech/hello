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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
