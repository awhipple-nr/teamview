class ChangeAndonOnTeam < ActiveRecord::Migration
  def change
    change_column_default :teams, :andon, 0
  end
end
