class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def add_all_weapons

    # Create record for each weapon
    weapons = params[:weapons]

    puts 'Here is the weapon list'
    puts weapons.to_yaml

    weapons.each do |w|
      add_weapon(w[:name], w[:category])
    end

    # Error Handling
    # begin
    #   render json: { message: 'Beginning operation' }
    # rescue
    #   render json: { message: 'Failed To Create' }
    # else
    #   render json: { message: 'Added successfully!' }
    # end

  end

  def add_weapon(name, category)

    # Create Weapon
    weaponCreated = Weapon.new
    weaponCreated.name = name
    weaponCreated.weapon_category_id = category
    weaponCreated.save

  end

  def submit_purchases

    purchases = params[:purchases]

    purchases.each do |p|
      # Create Purchase
      this_purchase = WeaponPurchase.new
      this_purchase.weapon_id = Weapon.find_by('name = ?', p.name).id
      this_purchase.wave_purchased = p.wave_purchased
      this_purchase.save
    end

  end

end
