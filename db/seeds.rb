require 'faker'
I18n.reload!

 10.times do
   teamname = "teamname"
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
     slack_channel: teamname + "slackchannel"
     )
    team.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 teams = Team.all


  puts "Seed finished"
  puts "#{Team.count} teams created"
