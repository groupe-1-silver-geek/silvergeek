class Senior < ApplicationRecord
  belongs_to :structure
  has_many :participations, dependent: :destroy
  has_many :activities, through: :participations

end
