class AddColumnsToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :animator, :string
    add_reference :activities, :structure, null: false, foreign_key: true
  end
end
