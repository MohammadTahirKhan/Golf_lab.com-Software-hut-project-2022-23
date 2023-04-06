class AddDefaultValueToUserRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :user_role, 2
  end
end
