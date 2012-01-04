class CreatePictureCategories < ActiveRecord::Migration
  def change
    create_table :picture_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
