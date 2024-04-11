class Structure < ApplicationRecord
  belongs_to :partner
  has_many :activities, dependent: :destroy
  has_many :seniors, dependent: :destroy

  def to_s
    "#{name}"
  end
end
