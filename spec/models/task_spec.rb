require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(name: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(name: 'tototo', content: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: 'vivi', content: 'bubu')
    expect(task).to be_valid
  end

  it "nameのみで検索できるかどうかのテスト" do
    task1 = Task.create!(name: 'vivi', content: 'vivi', status: 'waiting')
    task2 = Task.create!(name: 'vivi', content: 'vivi', status: 'working')
    tasks = Task.name_search('vivi')
    expect(tasks).to include task1, task2
  end

    it "contentのみの検索ができるかテスト" do
     task1 = Task.create!(name: "vivi", content: "vivi", status: "waiting")
     task2 = Task.create!(name: 'vivi', content: "vivi", status: "working")
     tasks = Task.status_search("working")
     expect(tasks).to include task2
    end

    it "nameとcontentで検索できるかどうかのテスト" do
      task1 = Task.create!(name: "vivi", content: "vivi", status: "working")
      task2 = Task.create!(name: 'vivi', content: "vivi", status: "working")
      tasks = Task.name_status_search("vivi","working")
      expect(tasks).to include task1, task2
    end
end
