class Phone < ApplicationRecord
  MIN_VALUE = 1_111_111_111
  MAX_VALUE = 9_999_999_999

  validates :phone,
            uniqueness: true,
            numericality: true,
            inclusion: MIN_VALUE..MAX_VALUE
  validates :user_email, presence: true

end
