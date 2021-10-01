class AddColumnDeadline < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :deadline, :time
  end
end
