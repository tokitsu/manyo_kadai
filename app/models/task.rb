class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status:{waiting:0 ,working:1 ,completed:2 }
  enum priority:{high:0 ,middle:1 ,low:2 }
  paginates_per 5
  belongs_to:user
end
