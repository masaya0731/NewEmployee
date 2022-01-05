class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :customer_id
      t.integer :category_id
      t.string :title
      t.text :body
      t.string :post_image

      t.timestamps
    end
  end
end
