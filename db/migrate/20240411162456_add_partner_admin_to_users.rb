class AddPartnerAdminToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :partner_admin, :boolean, default: false
  end
end
