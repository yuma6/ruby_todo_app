class Task < ApplicationRecord
    validates :content, :start_time, {presence: true}
end
