class CreateSubtitles < ActiveRecord::Migration[5.0]
  def change
    add_attachment :posts, :subtitle
  end
end
