class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.integer :post_id
      t.text :text

      t.timestamps
    end
  end
end
