class ChengeDataDeadline < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :deadline, :datetime
  end
end
