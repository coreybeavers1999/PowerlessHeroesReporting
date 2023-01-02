class AddAssignedToProgress < ActiveRecord::Migration[7.0]
  def change
    add_column :progresses, :assigned, :string
  end
end
