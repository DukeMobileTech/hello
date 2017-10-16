# == Schema Information
#
# Table name: categories
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  pictogram_file_name    :string
#  pictogram_content_type :string
#  pictogram_file_size    :integer
#  pictogram_updated_at   :datetime
#  pictogram_data         :text
#  position               :integer
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
