class RenameResourceToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :tag, :string
    add_column :resources, :title, :string
    rename_column :resources, :post_id, :category_id
    rename_table :resources, :pages
  end
end
