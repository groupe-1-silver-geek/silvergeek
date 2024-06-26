class Activity < ApplicationRecord
  belongs_to :game
  belongs_to :device
  belongs_to :structure
  has_many :participations, dependent: :destroy
  has_many :seniors, through: :participations
end
