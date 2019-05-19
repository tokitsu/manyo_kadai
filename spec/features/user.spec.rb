require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "ユーザー作成のテスト" do

    visit new_user_path

    fill_in 'user_name', with: 'vivi'
    fill_in 'user_email', with: 'vivi@yahoo.co.jp'
    fill_in 'user_password', with: 'vivivi'
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    expect(page).to have_content 'vivi'

  end

  scenario "ユーザー作成時の空の名前　バリデーションのテスト" do

    visit new_user_path

    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'vivi@yahoo.co.jp'
    fill_in 'user_password', with: 'vivivi'
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    expect(page).to have_content '名前を入力してください'

  end

  scenario "ユーザー作成時、空のメールアドレス　バリデーションテスト" do

    visit new_user_path

    fill_in 'user_name', with: 'vivi'
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: 'vivivi'
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    expect(page).to have_content 'メールアドレスを入力してください'

  end

  scenario "ユーザー作成時、空のパズワード　バリデーションテスト" do

    visit new_user_path

    fill_in 'user_name', with: 'vivi'
    fill_in 'user_email', with: 'vivi@yahoo.co.jp'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    expect(page).to have_content 'パスワードを入力してください'

  end

  scenario "ユーザー作成時、パスワードが一致していないバリデーションのテスト" do

    visit new_user_path

    fill_in 'user_name', with: 'vivi'
    fill_in 'user_email', with: 'vivi@yahoo.co.jp'
    fill_in 'user_password', with: 'bobobo'
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    expect(page).to have_content 'パスワードの入力が一致しません'

  end

  scenario "ログアウトのテスト" do

    visit new_user_path

    fill_in 'user_name', with: 'vivi'
    fill_in 'user_email', with: 'vivi@yahoo.co.jp'
    fill_in 'user_password', with: 'vivivi'
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    click_on 'ログアウト'

    expect(page).to have_content 'ログアウトしました'

  end

  scenario "ログインのテスト" do

    visit new_user_path

    fill_in 'user_name', with: 'vivi'
    fill_in 'user_email', with: 'vivi@yahoo.co.jp'
    fill_in 'user_password', with: 'vivivi'
    fill_in 'user_password_confirmation', with: 'vivivi'

    click_on '登録する'

    click_on 'ログアウト'

    fill_in 'session_email', with: 'vivi@yahoo.co.jp'
    fill_in 'session_password', with: 'vivivi'

    click_on 'ログインする'

    expect(page).to have_content 'ログアウト'

  end


end
