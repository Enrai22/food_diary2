class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :category
      t.integer :user_id
      t.float :rate_deli
      t.float :rate_acc
      t.float :rate_rep
      t.float :rate_cost

      t.timestamps
    end
  end
end
