class AddColumnDatetimeTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expired_date, :date
  end
end
