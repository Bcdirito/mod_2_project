class CreateMusicianGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :musician_genres do |t|
      t.belongs_to :musician, foreign_key: true
      t.belongs_to :genre, foreign_key: true
    end
  end
end
