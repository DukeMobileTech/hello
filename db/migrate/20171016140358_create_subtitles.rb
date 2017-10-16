class CreateSubtitles < ActiveRecord::Migration[5.0]
  def change
    create_table :subtitles do |t|
      t.integer :post_id
      t.string :language
      t.text :subtitle_data
      t.timestamps
    end
  end
end
