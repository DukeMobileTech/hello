# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  category_id :integer
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag         :string
#  title       :string
#

# For posting pages about external links, about etc
class Page < ApplicationRecord
  default_scope { order(updated_at: :desc) }
  belongs_to :category, touch: true
end
