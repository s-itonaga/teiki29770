class Calendar < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :day
  end

end
