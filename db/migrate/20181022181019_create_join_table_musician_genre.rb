class CreateJoinTableMusicianGenre < ActiveRecord::Migration[5.2]
  def change
    create_join_table :musicians, :genres do |t|
      t.index [:musician_id, :genre_id]
      # t.index [:genre_id, :musician_id]
    end
  end
end
