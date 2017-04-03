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

require 'test_helper'

class TranscriptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
