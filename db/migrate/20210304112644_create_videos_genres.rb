class CreateVideosGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :videos_genres do |t|
      t.references :video, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
