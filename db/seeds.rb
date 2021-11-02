# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
    User.create!(
        email: "test#{n+1}@example.com",
        password: "example#{n+1}"
    )
end

5.times do |n|
    Team.create!(
        team_name: "test-team#{n+1}"
    )
end

5.times do |n|
    Task.create!(
        content: "user1-team#{n+1}",
        user_id: "1",
        team_id: "#{n+1}",
        start_time: "2021-10-27"
    )
end
5.times do |n|
    Task.create!(
        content: "user2-team#{n+1}",
        user_id: "2",
        team_id: "#{n+1}",
        start_time: "2021-10-27"
    )
end
5.times do |n|
    Task.create!(
        content: "user3-team#{n+1}",
        user_id: "3",
        team_id: "#{n+1}",
        start_time: "2021-10-27"
    )
end
5.times do |n|
    Task.create!(
        content: "user4-team#{n+1}",
        user_id: "4",
        team_id: "#{n+1}",
        start_time: "2021-10-27"
    )
end
5.times do |n|
    Task.create!(
        content: "user5-team#{n+1}",
        user_id: "5",
        team_id: "#{n+1}",
        start_time: "2021-10-27"
    )
end