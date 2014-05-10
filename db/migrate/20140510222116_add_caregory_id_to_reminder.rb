class AddCaregoryIdToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :category_id, :integer
  end
end
