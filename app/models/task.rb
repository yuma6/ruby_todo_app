class Task < ApplicationRecord
    validates :content, :start_time, {presence: true}

    belongs_to :user
end
