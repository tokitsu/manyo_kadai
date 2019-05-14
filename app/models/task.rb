class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  enum status:{waiting:0 ,working:1 ,completed:2 }

  scope :name_search, -> (name) { where("name LIKE ?", "%#{ name }%") }
  scope :status_search, -> (status) { where(status: status) }
  scope :name_status_search, -> (name, status) { where("name LIKE ?", "%#{ name }%").where(status: status) }
end
