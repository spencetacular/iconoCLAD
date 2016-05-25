class AddMyIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :my_id, :integer
    add_column :users, :my_last_name, :string
  end
end
