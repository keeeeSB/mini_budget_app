require 'rails_helper'

RSpec.describe "記録機能", type: :system do
  scenario "ユーザーは新しい記録を作成できる" do
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)
    sign_in user

    visit root_path
    click_link "記録作成"

    fill_in "日付", with: "Wed, 01 Jan 2025"
    fill_in "金額", with: "10000"
    fill_in "説明", with: "エアコンを使いすぎた。"
    select "電気代", from: "カテゴリーを選択"
    click_button "作成"

    expect(page).to have_content "記録を作成しました。"

    expect(page).to have_content "2025-01-01"
    expect(page).to have_content "10000"
    expect(page).to have_content "エアコンを使いすぎた。"
    expect(page).to have_content "電気代"
  end
end
