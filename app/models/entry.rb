class Entry < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :amount, presence: true
  validates :description, length: { maximum: 100 }
end
