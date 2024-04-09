class AddSuggestionToActivity < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :suggestion, :string
  end
end
