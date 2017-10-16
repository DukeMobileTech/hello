# == Schema Information
#
# Table name: documents
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  title         :string
#  description   :text
#  language      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  doc_file_data :text
#

class Document < ApplicationRecord
  include DocumentUploader::Attachment.new(:doc_file)
  default_scope { order(updated_at: :desc) }
  belongs_to :category, touch: true
end
