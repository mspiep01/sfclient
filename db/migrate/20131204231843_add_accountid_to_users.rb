class AddAccountidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accountid, :string
  end
end
