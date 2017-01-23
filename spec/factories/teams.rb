FactoryGirl.define do
  factory :team do
    name "MyString"
    andon "green"
    members "MyMembers"
    charter "MyCharter"
    vision "MyVision"
    mission "MyMission"
    mission_tests "MyMissionTests"
    success_criteria "MySuccessCriteria"
    responsibilities "MyResponsibilities"
    accounting_code "MyCode"
    jira_project_key "MyJiraKey"
    sequence(:email){|n| "user#{n}@newrelic.com" }
    slack_channel "MySlackChannel"
    created_at Time.zone.now.change(usec: 0)
  end

  factory :invalid_team do
    name nil
    andon nil
  end
end
