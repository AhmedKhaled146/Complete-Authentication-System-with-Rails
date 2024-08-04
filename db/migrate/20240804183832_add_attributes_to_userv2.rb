class AddAttributesToUserv2 < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
  end
end
