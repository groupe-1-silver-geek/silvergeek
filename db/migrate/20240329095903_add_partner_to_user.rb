class AddPartnerToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :partner, null: false, foreign_key: true
  end
end
