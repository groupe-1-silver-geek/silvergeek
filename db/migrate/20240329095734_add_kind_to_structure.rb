class AddKindToStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :structures, :kind, :integer
  end
end
