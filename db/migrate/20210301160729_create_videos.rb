class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :genre
      t.string :kind

      t.timestamps
    end
  end
end
