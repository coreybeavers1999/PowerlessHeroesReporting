class RankingController < ApplicationController
  def index

    sql = 'select name,
       weapon_category_id,
       ((select count(id) from weapon_purchases where weapon_id = weapons.id)) as purchases,
       case when ((select sum(damage) from weapon_damages where weapon_id = weapons.id) is not null) then (select sum(damage) from weapon_damages where weapon_id = weapons.id) else 0 end as damage,
       (select avg(wave_purchased) from weapon_purchases where cheated is false and weapon_id = weapons.id group by weapon_id) as avg_wave,
       weapons.image_url
        from weapons
                 left join weapon_purchases wp on weapons.id = wp.weapon_id
        where wp.cheated is false
        group by name, weapon_category_id, weapons.id
        order by purchases desc, damage desc;'

    @weapons = ActiveRecord::Base.connection.exec_query(sql).rows
  end
end
