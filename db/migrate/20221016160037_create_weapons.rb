class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.references :weapon_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
