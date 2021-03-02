class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :title
      t.string :genre
      t.string :kind

      t.timestamps
    end
  end
end
