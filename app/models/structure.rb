class Structure < ApplicationRecord
  belongs_to :partner
  has_many :seniors
  has_many :activities

  def to_s
    "#{name}"
  end
end
