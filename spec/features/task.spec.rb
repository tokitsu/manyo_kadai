# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'
# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    name { "test2" }
    content {"testtesttest"}
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    name { 'test1' }
    content { 'samplesample' }
  end
end

RSpec.feature "タスク管理機能", type: :feature do
  background do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

# 省略

# scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
  # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path

  # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
  # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do

    visit new_task_path



    fill_in 'name' ,with: 'com'
    fill_in 'content' , with: 'www'


    click_on '投稿する'

    expect(page).to have_content '新規作成'
  end

  scenario "タスク詳細のテスト" do

    task = Task.create!(name: 'test55',content: 'test333')

    visit task_path(task.id)

    expect(page).to have_content 'test333'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do

    visit tasks_path

      task_names = Task.all.map(&:name)

      expect(task_names).to eq %w(test2 test1)



  end
end
