require 'rails_helper'

RSpec.describe "ユーザー登録", type: :system do
  scenario "ユーザーは正常なユーザー登録ができる" do
    visit root_path
    click_link "新規登録"

    fill_in "お名前", with: "テストユーザー"
    fill_in "メールアドレス", with: "tester@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード再確認", with: "password"
    click_button "登録"

    expect(page).to have_content "アカウント登録が完了しました。"
    expect(current_path).to eq root_path
  end
end
