class Calendar < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy

  with_options presence: true do
    validates :day
  end
end
