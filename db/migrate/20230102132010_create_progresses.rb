class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.string :category
      t.string :description
      t.integer :expected_days
      t.boolean :complete

      t.timestamps
    end
  end
end
