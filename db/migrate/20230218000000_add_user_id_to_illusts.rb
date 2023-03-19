class AddUserIdToIllusts < ActiveRecord::Migration[6.1]
  def change
    add_column :illusts, :user_id, :integer
  end
end
