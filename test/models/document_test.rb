# == Schema Information
#
# Table name: documents
#
#  id                    :integer          not null, primary key
#  category_id           :integer
#  title                 :string
#  description           :text
#  language              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  doc_file_file_name    :string
#  doc_file_content_type :string
#  doc_file_file_size    :integer
#  doc_file_updated_at   :datetime
#  doc_file_data         :text
#

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
