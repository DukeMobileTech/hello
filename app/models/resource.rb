# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# For posting external links
class Resource < ApplicationRecord
  belongs_to :post
end
