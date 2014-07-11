class AddMailsendToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mail_send, :integer, default: 0
  end
end
