class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :listener, foreign_key: true
      t.belongs_to :musician, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
