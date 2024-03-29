class CreateSeniors < ActiveRecord::Migration[7.1]
  def change
    create_table :seniors do |t|
      t.string :pseudo
      t.integer :age
      t.string :gender
      t.integer :code
      t.references :structure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
