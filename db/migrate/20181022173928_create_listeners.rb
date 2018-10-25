class CreateListeners < ActiveRecord::Migration[5.2]
  def change
    create_table :listeners do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password_digest
      t.string :picture

      t.timestamps
    end
  end
end
