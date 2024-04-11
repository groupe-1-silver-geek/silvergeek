class AddValidated < ActiveRecord::Migration[7.1]
    def change
      add_column :users, :isValidated, :boolean, default: false
    end
  end
  