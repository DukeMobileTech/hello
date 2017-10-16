class RemovePaperClipAttachments < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :categories, :pictogram
    remove_attachment :documents, :doc_file
    remove_attachment :posts, :video
    remove_attachment :posts, :subtitle
    remove_column :posts, :subtitle_data
    remove_attachment :translations, :audio
  end
end
