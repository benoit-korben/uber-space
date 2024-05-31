class RemoveMessageFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications, :message, :string
  end
end
