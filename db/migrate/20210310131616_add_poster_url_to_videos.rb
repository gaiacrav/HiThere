class AddPosterUrlToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :poster_url, :string
  end
end
