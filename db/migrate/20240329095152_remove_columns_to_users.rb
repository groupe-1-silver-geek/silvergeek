class RemoveColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :animator, :string
    remove_reference :users, :structure, null: false, foreign_key: true
  end
end
