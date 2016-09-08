class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :likeable, polymorphic: true
      t.integer :user_id

      t.timestamps
    end
    add_index :likes, :user_id
  end
end
