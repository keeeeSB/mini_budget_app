require 'rails_helper'

RSpec.describe Category, type: :model do
  it "有効なデータを作成できる" do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it "正確な値を入力すると、有効なカテゴリーを作成できる" do
    category = Category.new(
      name: "食費"
    )
    expect(category).to be_valid
  end

  let(:category) { FactoryBot.create(:category) }

  describe "バリデーションのテスト" do
    it "カテゴリー名は必須である" do
      category.name = " "
      expect(category).to_not be_valid
    end

    it "カテゴリー名は一意である" do
      Category.create(name: "電気代")
      other_category = Category.new(name: "電気代")
      expect(other_category).to_not be_valid
    end
  end
end
