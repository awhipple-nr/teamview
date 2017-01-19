
100.times do
   User.create!(
     email: Faker::Internet.email,
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     created_at: Faker::Date.backward(360)
     )
 end

testuser = User.create!(
     email: "you@me.com",
     first_name: "Test",
     last_name: "User",
     created_at: Faker::Date.backward(360)
     )
     testuser.save!

 users = User.all

 10.times do
   teamname = Faker::Superhero.power
   team = Team.create!(
     name: teamname,
     andon: 0,
     members: "first last, first last, first last, first last, first last, first last",
     charter: Faker::Lorem.paragraph,
     vision: Faker::Lorem.paragraph,
     mission: Faker::Lorem.paragraph,
     responsibilities: Faker::Lorem.paragraph,
     mission_tests: Faker::Hacker.say_something_smart,
     success_criteria: Faker::Hacker.verb,
     accounting_code: Faker::Number.number(3),
     jira_project_key: Faker::Number.number(4),
     email: teamname + "@newrelic.com",
     slack_channel: teamname + " " + Faker::StarWars.specie,
     )
    team.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 teams = Team.all


  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Team.count} teams created"
  # puts "#{Event.count} events created"
