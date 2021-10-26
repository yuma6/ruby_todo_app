class Task < ApplicationRecord
    validates :content, :start_time, presence: true, on: :add_task
    belongs_to :user
    belongs_to :team, optional: :true
    
end
