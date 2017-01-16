class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :andon
      t.text :members
      t.text :charter
      t.text :vision
      t.text :mission
      t.text :mission_tests
      t.text :success_criteria
      t.text :responsibilities
      t.text :accounting_code
      t.string :jira_project_key
      t.string :email
      t.string :slack_channel

      t.timestamps null: false
    end
  end
end
