class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :language
      t.timestamps
    end
    add_attachment :documents, :doc_file
  end
end
