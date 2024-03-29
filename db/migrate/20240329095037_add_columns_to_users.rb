class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :animator, :string
    add_reference :users, :structure, null: false, foreign_key: true
  end
end
