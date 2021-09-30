class Task < ApplicationRecord
    validates :content,{presence: true}
    validates :start_time,{presence: true}
end
