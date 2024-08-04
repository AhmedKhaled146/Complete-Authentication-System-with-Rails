class ChangeColumnNull < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :username, false
  end
end
