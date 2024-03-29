class Participation < ApplicationRecord
  has_many :seniors
  has_many :activities
end
