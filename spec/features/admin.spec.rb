require 'rails_helper'
# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）


RSpec.feature "タスク管理機能", type: :feature do


  scenario "タスク一覧のテスト" do

  end

  scenario "タスク作成のテスト" do

  end

  scenario "タスク詳細のテスト" do
  
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do

    visit tasks_path

    task_names = Task.all.order(created_at: "DESC").map(&:name)

    expect(task_names).to eq %w(test2 test1)

  end

  scenario "タスクが終了期限順にならんでいるかのテスト" do

    visit tasks_path(sort_expired: "true")

    task_dates = Task.all.order(expired_date: "ASC").map(&:name)

    expect(task_dates).to eq %w(test2 test1)

  end

  scenario "タスクが優先順位に並んでいるかのテスト" do

    visit tasks_path(sort_priority: "true")

    task_priorities = Task.all.order(priority:"ASC").map(&:name)

    expect(task_priorities).to eq %w(test2 test1)

  end

end
