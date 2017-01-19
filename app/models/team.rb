class Team < ActiveRecord::Base

  default_scope { order('name ASC') }
  validates :name, presence: true
  validates :andon, presence: true
  validates :email, email: true, format: { with: /[A-Za-z0-9_.-]+@newrelic\.com\z/,
                  message: "must be a valid newrelic.com account" }

  enum andon: [:green, :yellow, :red]

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end

end
