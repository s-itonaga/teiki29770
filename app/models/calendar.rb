class Calendar < ApplicationRecord
  belongs_to :user
  has_many :stocks

  with_options presence: true do
    validates :day
  end

end
