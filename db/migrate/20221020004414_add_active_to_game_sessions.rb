class AddActiveToGameSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :game_sessions, :active, :boolean
  end
end
