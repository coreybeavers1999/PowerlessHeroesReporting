class HomeController < ApplicationController
  def index
    @weapon_count = WeaponPurchase.count
    puts 'This is the weapon count.'
    puts @weapon_count
  end
end
