class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.integer :picture_category_id
      t.integer :likes_count, :default => 0

      t.timestamps
    end
  end
end
