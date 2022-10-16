class AddWavePurchasedToWeaponPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :weapon_purchases, :wave_purchased, :integer
  end
end
