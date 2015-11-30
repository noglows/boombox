class RemDur < ActiveRecord::Migration
  def change
    remove_column :songs, :url_duration
  end
end
