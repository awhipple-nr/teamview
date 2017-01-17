class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :andon, :created_at, :members, :charter, :vision, :mission, :mission_tests,
    :success_criteria, :responsibilities, :accounting_code, :jira_project_key, :email, :slack_channel
end
