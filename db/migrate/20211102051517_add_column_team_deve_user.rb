class AddColumnTeamDeveUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deve_user, :boolean, default: false, null: false
  end
end
