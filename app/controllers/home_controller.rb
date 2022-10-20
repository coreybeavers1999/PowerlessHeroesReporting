class HomeController < ApplicationController
  def index

    # Session List
    sql = 'select map, substr(((updated_at - created_at)::time)::text,1,8) as time from game_sessions where active is true'
    @game_list = ActiveRecord::Base.connection.exec_query(sql).rows

    # Weapon List
    @weapon_list = Weapon.all

  end
end
