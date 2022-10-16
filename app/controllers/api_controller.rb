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

end
