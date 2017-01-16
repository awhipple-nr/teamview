class Team < ActiveRecord::Base

  default_scope { order('name ASC') }
  validates :name, presence: true
  validates :andon, presence: true

  enum andon: [:green, :yellow, :red]

  # after_create :send_team_notification
end
