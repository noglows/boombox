class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fav_genres
      t.integer :num_songs

      t.timestamps null: false
    end
  end
end
