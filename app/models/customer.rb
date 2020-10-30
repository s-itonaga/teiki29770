class Customer < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/,      message: 'は全角カタカナで入力してください' }
    validates :phone_number,numericality: { only_integer: true }, length: { maximum: 11 }
  end

end
