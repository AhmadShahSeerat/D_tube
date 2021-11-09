class ChangeDislikeToDislikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :designs, :dislike, :dislikes

  end
end
