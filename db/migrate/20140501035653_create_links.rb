class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.date :expire_date
      t.integer :hits

      t.timestamps
    end
  end
end
