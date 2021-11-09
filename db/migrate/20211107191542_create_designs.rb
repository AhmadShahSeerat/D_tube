class CreateDesigns < ActiveRecord::Migration[6.1]
  def change
    create_table :designs do |t|
      t.string :title
      t.string :design_url
      t.text :description
      t.integer :views, default: 0
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0

      t.timestamps
    end
  end
end
