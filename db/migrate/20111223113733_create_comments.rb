class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_email
      t.integer :user_id
      t.integer :picture_id
      t.text :body

      t.timestamps
    end
  end
end
