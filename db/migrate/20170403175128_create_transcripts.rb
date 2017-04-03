class CreateTranscripts < ActiveRecord::Migration[5.0]
  def change
    create_table :transcripts do |t|
      t.integer :post_id
      t.string :language
      t.string :title
      t.text :text

      t.timestamps
    end
    remove_column :posts, :transcript
  end
end
