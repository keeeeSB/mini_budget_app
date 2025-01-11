class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :date, presence: true
  validates :amount, presence: true
  validates :description, length: { maximum: 100 }

  # 支出合計を計算
  def self.total_expense
    where("amount < 0").sum(:amount)
  end
end
