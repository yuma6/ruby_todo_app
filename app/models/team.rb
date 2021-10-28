class Team < ApplicationRecord
    validates :team_name, presence: true, uniqueness: true, on: :create
    has_many :team_users, dependent: :destroy
    has_many :users, through: :team_users
    has_many :tasks
end
