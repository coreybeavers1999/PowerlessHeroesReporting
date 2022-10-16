class RankingController < ApplicationController
  def index
    @weapons = Weapon.select('name,
       weapon_category_id,
       ((select count(id) from weapon_purchases where weapon_id = weapons.id)) as purchases,
       ((select sum(damage) from weapon_damages where weapon_id = weapons.id)) as damage')
                     .order(Arel.sql('purchases desc, damage desc'))

  end
end
