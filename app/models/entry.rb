class Entry < ApplicationRecord
  belongs_to :user
  has_many :category_entries, dependent: :destroy
  has_many :categories, through: :category_entries

  validates :date, presence: true
  validates :amount, presence: true
  validates :description, length: { maximum: 100 }
end
