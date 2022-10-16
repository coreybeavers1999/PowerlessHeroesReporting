class RankingController < ApplicationController
  def index
    @weapons = Weapon.select('weapons.name, weapons.weapon_category_id, count(weapon_purchases) as count')
                     .joins('left join weapon_purchases on weapons.id = weapon_purchases.weapon_id')
                     .group('weapons.weapon_category_id, weapons.name, weapons.id')
                     .order('count desc, weapon_category_id, weapons.id')
  end
end
