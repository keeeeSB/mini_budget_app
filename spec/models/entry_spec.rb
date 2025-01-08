require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:entry) { FactoryBot.create(:entry) }

  describe "ファクトリの有効性" do
    it "有効なデータを作成できる" do
      expect(FactoryBot.build(:entry)).to be_valid
    end
  end

  describe "記録作成のテスト" do
    it "正確な値を入力すると、有効な記録を作成できる" do
      entry = user.entries.build(
        date: "2025-01-01",
        amount: "1000",
        description: "冬になるとエアコンをたくさん使う。"
      )
      expect(entry).to be_valid
    end
  end

  describe "バリデーションのテスト" do
    it "日付は必須である" do
      entry.date = " "
      expect(entry).to_not be_valid
    end

    it "金額は必須である" do
      entry.amount = " "
      expect(entry).to_not be_valid
    end

    it "説明文は最大で100文字以内である" do
      entry.description = "a" * 101
      expect(entry).to_not be_valid

      entry.description = "a" * 100
      expect(entry).to be_valid
    end
  end
end
