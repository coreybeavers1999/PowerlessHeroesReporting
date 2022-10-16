class HomeController < ApplicationController
  def index
    @weapon_list = Weapon.all
  end
end
