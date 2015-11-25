class AddColtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :voted_for, :string
  end
end
