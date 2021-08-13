class CreatePostContents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_contents do |t|
      t.text :name
      t.text :email
      t.text :subject
      t.text :body, null: false
      t.integer :category_id
      t.boolean :is_hide, default: false
      t.integer :hide_user_id, default: 0

      t.timestamps
    end
  end
end
