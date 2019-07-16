# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "管理ユーザー画面のテスト", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "管理ユーザー一覧画面" do
  User.create!(name: 'vivi',email: 'vivi@yahoo.co.jp',password: 'vivivi',password_confirmation: 'vivivi',admin:'true')

  visit new_session_path

  fill_in 'session_email', with: 'vivi@yahoo.co.jp'
  fill_in 'session_password', with: 'vivivi'

  click_on 'ログインする'

  click_on 'ユーザー管理画面'




  expect(page).to have_content '管理ユーザー画面だよ'



  end

  scenario "管理ユーザーのユーザーの新規作成テスト" do
    User.create!(name: 'vivi',email: 'vivi@yahoo.co.jp',password: 'vivivi',password_confirmation: 'vivivi',admin:'true')

    visit new_session_path

    fill_in 'session_email', with: 'vivi@yahoo.co.jp'
    fill_in 'session_password', with: 'vivivi'

    click_on 'ログインする'

    click_on 'ユーザー管理画面'

    click_on 'ユーザーの新規作成'

    fill_in 'user_name', with: 'wewe'
    fill_in 'user_email', with: 'wewe@yahoo.co.jp'
    fill_in 'user_password', with: 'wewewe'
    fill_in 'user_password_confirmation', with: 'wewewe'

    click_on '作成する'



    expect(page).to have_content '管理ユーザー画面だよ','wewe'


  end

  scenario "管理ユーザーのユーザーの詳細画面テスト" do
    User.create!(name: 'vivi',email: 'vivi@yahoo.co.jp',password: 'vivivi',password_confirmation: 'vivivi',admin:'true')

    visit new_session_path

    fill_in 'session_email', with: 'vivi@yahoo.co.jp'
    fill_in 'session_password', with: 'vivivi'

    click_on 'ログインする'

    click_on 'ユーザー管理画面'

    user = User.create!(name: 'gogo',email: 'gogo@yahoo.co.jp',password: 'gogogo',password_confirmation: 'gogogo')

    visit admin_user_path(user.id)



    expect(page).to have_content 'gogoさんのタスク'


  end

  scenario "ユーザーの削除のテスト" do
    User.create!(name: 'vivi',email: 'vivi@yahoo.co.jp',password: 'vivivi',password_confirmation: 'vivivi',admin:'true')

    visit new_session_path

    fill_in 'session_email', with: 'vivi@yahoo.co.jp'
    fill_in 'session_password', with: 'vivivi'

    click_on 'ログインする'

    click_on 'ユーザー管理画面'

    user = User.create!(name: 'gogo',email: 'gogo@yahoo.co.jp',password: 'gogogo',password_confirmation: 'gogogo')

　　   visit admin_edit_user_path(user.id)







    expect(page).to have_content 'gogo'


  end
end
