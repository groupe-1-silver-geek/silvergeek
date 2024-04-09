class Partner < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :structures, dependent: :destroy
end
