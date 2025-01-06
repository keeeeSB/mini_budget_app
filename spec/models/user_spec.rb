require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なデータを作成できる" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "正確なデータを入力すると、有効なユーザーが作成できる" do
    user = User.new(
      name:  "テストユーザー",
      email: "tester@example.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to be_valid
  end

  let(:user) { FactoryBot.create(:user) }

  describe "バリデーションのテスト" do
    it "お名前は必須である" do
      user.name = " "
      expect(user).to_not be_valid
    end

    it "メールアドレスは必須である" do
      user.email = " "
      expect(user).to_not be_valid
    end

    it "パスワードは必須である" do
      user.password = " "
      expect(user).to_not be_valid
    end

    it "パスワードは最低6文字以上である" do
      user.password = "a" * 5
      user.password_confirmation = "a" * 5
      expect(user).to_not be_valid

      user.password = "a" * 6
      user.password_confirmation = "a" * 6
      expect(user).to be_valid
    end
  end
end
