class RenameDeadline < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :deadline, :start_time
  end
end
