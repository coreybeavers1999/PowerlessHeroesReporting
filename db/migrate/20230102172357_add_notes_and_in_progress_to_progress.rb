class AddNotesAndInProgressToProgress < ActiveRecord::Migration[7.0]
  def change
    add_column :progresses, :notes, :string
    add_column :progresses, :in_progress, :boolean
  end
end
