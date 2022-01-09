class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|

      t.integer :customer_id
      t.integer :post_id
      t.text :body
      t.string :comment_image_id

      t.timestamps
    end
  end
end
