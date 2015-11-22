class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.string :comments
      t.integer :votes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
