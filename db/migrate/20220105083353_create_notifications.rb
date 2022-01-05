class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|

      t.integer :post_comment_id
      t.integer :visitor_id
      t.integer :visited_id
      t.boolean :checked, default: false, null: false
      t.string :action, default: '', null: false

      t.timestamps
    end
  end
end
