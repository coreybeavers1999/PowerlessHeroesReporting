class AddCheatedToWeaponPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :weapon_purchases, :cheated, :boolean
  end
end
