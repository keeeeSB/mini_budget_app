require 'rails_helper'

RSpec.describe "ログイン機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  scenario "ユーザーは正常な値を入力すると、ログインできる" do
    visit root_path
    click_link "ログイン"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to have_content "ログインしました。"
    expect(current_path).to eq root_path
  end

  scenario "アカウント承認が出来ていないユーザーはログインできない" do
    user.update(confirmed_at: nil)

    visit root_path
    click_link "ログイン"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to have_content "メールアドレスの本人確認が必要です。"
    expect(current_path).to eq new_user_session_path
  end
end
