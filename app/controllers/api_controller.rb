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

    purchases = params[:weapons]

    # Error Catching
    if purchases.nil? then
      render json: { message: 'Nothing was submitted' }
      return
    end

    puts purchases.to_yaml

    purchases.each_with_index do |p, index|
      # Create Purchase
      this_purchase = WeaponPurchase.new
      this_purchase.weapon_id = Weapon.find_by('name = ?', params[:weapons][index][:name]).id
      this_purchase.wave_purchased =  params[:weapons][index][:wave_purchased]
      this_purchase.cheated = params[:weapons][index][:cheated]
      this_purchase.save
    end

  end

  def open_game_session

    session = GameSession.new
    session.map = params[:map]
    session.active = true
    session.save

    render json: { id: session.id }

  end

  def close_game_session

    session = GameSession.find(params[:id])
    session.active = false
    session.save

  end

end
