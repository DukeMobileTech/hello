class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :category_id
      t.text :transcript
      t.string :video_meta

      t.timestamps
    end
    add_attachment :posts, :video
    create_table :translations do |t|
      t.string :title
      t.string :language
      t.integer :post_id

      t.timestamps
    end
    add_attachment :translations, :audio
  end
end
