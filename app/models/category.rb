class Category < ApplicationRecord
  has_many :category_entries, dependent: :destroy
  has_many :categories, through: :category_entries

  validates :name, presence: true, uniqueness: true
end
