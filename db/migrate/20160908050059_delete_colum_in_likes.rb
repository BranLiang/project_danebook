class DeleteColumInLikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :like
  end
end
