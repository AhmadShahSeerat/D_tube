class RemoveCollageIdFromDesigns < ActiveRecord::Migration[6.1]
  def change
    remove_column :designs, :collage_id
  end
end
