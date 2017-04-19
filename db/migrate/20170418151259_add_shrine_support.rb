class AddShrineSupport < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :pictogram_data, :text
    add_column :posts, :video_data, :text
    add_column :posts, :subtitle_data, :text
    add_column :translations, :audio_data, :text
    add_column :documents, :doc_file_data, :text
  end
end
