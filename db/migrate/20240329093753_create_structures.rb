class CreateStructures < ActiveRecord::Migration[7.1]
  def change
    create_table :structures do |t|
      t.string :adress
      t.integer :zipCode
      t.string :city
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
