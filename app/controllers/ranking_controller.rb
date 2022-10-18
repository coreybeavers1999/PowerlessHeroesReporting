class RankingController < ApplicationController
  def index
    @weapons = Weapon.select('name,
       weapon_category_id,
       ((select count(id) from weapon_purchases where weapon_id = weapons.id)) as purchases,
       case when ((select sum(damage) from weapon_damages where weapon_id = weapons.id) is not null) then (select sum(damage) from weapon_damages where weapon_id = weapons.id) else 0 end as damage')
                     .order(Arel.sql('purchases desc, damage desc'))

  end
end
