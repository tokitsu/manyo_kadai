class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status:{waiting:0 ,working:1 ,completed:2 }
end
