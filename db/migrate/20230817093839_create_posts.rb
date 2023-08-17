class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.string :text
      t.integer :comments_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
