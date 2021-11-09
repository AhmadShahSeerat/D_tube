class AddCollageIdToDesign < ActiveRecord::Migration[6.1]
  def change
    add_column :designs, :collage_id, :integer
  end
end
