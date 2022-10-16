class CreateWeaponDamages < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_damages do |t|
      t.references :weapon, null: false, foreign_key: true
      t.float :damage

      t.timestamps
    end
  end
end
