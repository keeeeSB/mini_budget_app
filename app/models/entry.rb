class Entry < ApplicationRecord
  belongs_to :user
  has_many :category_entries, dependent: :destroy
  has_many :categories, through: :category_entries

  validates :date, presence: true
  validates :amount, presence: true
  validates :description, length: { maximum: 100 }

  # 支出合計を計算
  def self.total_expense
    where("amount < 0").sum(:amount)
  end
end
