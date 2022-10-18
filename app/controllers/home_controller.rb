class HomeController < ApplicationController
  def index
    @game_list = GameSession.all
    @weapon_list = Weapon.all
  end
end
