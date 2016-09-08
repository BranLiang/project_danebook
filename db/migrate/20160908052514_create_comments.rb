class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.text    :body,    null: false
      t.references :commentable, polymorphic: true
      t.integer :likes_count, default: 0, null: false

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
