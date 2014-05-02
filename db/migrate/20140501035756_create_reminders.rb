class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :title
      t.text :body
      t.date :remind_date
      t.date :expire_date

      t.timestamps
    end
  end
end
