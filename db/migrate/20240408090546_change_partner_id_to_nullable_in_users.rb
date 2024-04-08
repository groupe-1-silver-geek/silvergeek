class ChangePartnerIdToNullableInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :partner_id, :bigint, null: true
  end
end
