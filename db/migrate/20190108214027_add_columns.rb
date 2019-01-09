class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :descrition, :text
    add_column :articles, :create_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
