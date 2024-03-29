class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.integer :duration
      t.references :game, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
      t.string :otherDevice

      t.timestamps
    end
  end
end
