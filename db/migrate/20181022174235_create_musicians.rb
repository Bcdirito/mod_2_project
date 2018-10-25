class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.belongs_to :genre
      t.string :band_members
      t.string :bio
      t.string :image
      t.string :song
      t.float :rate
      t.text :links

      t.timestamps
    end
  end
end
