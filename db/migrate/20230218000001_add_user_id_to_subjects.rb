class AddUserIdToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :user_id, :string
  end
end
