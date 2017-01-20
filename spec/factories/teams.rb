FactoryGirl.define do
  factory :team do
    name "MyString"
    andon "green"
    members "MyText"
    charter "MyText"
    vision "MyText"
    mission "MyText"
    mission_tests "MyText"
    success_criteria "MyText"
    responsibilities "MyText"
    accounting_code "MyText"
    jira_project_key "MyString"
    sequence(:email){|n| "user#{n}@newrelic.com" }
    slack_channel "MyString"
  end
end
