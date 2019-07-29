require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "nameが空だとバリデーションが通らない" do
    user = User.new(name:"",email:"gogo@go.co.jp",password:"6666")
    expect(user).not_to be_valid
  end

  it "emailが空だとバリデーションが通らない" do
    user = User.new(name:"coco",email:"",password:"3333")
    expect(user).not_to be_valid
  end

  it "passwordが空だとバリデーションが通らない" do
    user = User.new(name:"wowo",email:"wowo@go.co.jp",password:"")
    expect(user).not_to be_valid
  end

  it "nameとemailとpasswordが入力されていればバリデーションが通る" do
    user = User.new(name:"yuyu",email:"yuyu@go.co.jp",password:"8888")
    expect(user).to be_valid
  end
end
