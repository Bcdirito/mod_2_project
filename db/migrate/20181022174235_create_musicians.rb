class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :genre
      t.string :band_members
      t.string :bio
      t.string :image
      t.integer :rate

      t.timestamps
    end
  end
end
