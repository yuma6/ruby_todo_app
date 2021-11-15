class CreateTeamUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_users do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
