class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :code, format: { with: /\A\d{8}\z/,       message: 'は半角数字8文字で入力してください' }
  end

  has_many :customers
  has_many :calendars
end
