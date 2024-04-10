class Participation < ApplicationRecord
  has_many :seniors
  has_many :activities
  belongs_to :senior
  belongs_to :activity



end
