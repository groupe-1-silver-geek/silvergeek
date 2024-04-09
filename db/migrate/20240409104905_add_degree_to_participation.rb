class AddDegreeToParticipation < ActiveRecord::Migration[7.1]
  def change
    add_column :participations, :degree, :integer, default: 0
  end
end
