class CreateWeaponPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_purchases do |t|
      t.string :name

      t.timestamps
    end
  end
end
