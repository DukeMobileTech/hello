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

class Document < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  belongs_to :category, touch: true
  has_attached_file :doc_file
  validates_attachment :doc_file, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  validates_attachment_file_name :doc_file, matches: [/pdf\Z/, /docx\Z/, /xlsx\Z/]
end
