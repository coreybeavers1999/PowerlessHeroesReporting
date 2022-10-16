class CreateWeaponPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_purchases do |t|
      t.references :weapon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
