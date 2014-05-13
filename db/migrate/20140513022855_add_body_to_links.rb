class AddBodyToLinks < ActiveRecord::Migration
  def change
    add_column :links, :body, :text
  end
end
