class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.string :genre
      t.string :band_members
      t.string :bio
      t.string :image
      t.float :rate

      t.timestamps
    end
  end
end
