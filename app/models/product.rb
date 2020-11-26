class Product < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :z_code, numericality: { only_integer: true }, length: { maximum: 5 }
    validates :num, numericality: { only_integer: true }, length: { maximum: 5 }
    validates :release
  end

end
