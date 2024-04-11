class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :partner, optional: true

  def partner?
    self.partner.present?
  end

  def pending?
    !admin? && !partner?
  end

end
