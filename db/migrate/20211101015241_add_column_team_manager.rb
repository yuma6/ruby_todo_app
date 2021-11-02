class AddColumnTeamManager < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :manager_id, :integer, default:1
  end
end
