class Customer < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :name_kana, format: { with: /\A[ぁ-んー－]+\z/, message: 'は全角平仮名で入力してください' }
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end
end
