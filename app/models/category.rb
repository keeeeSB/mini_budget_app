class Category < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
