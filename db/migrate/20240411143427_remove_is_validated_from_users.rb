class RemoveIsValidatedFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :isValidated, :boolean
  end
end
