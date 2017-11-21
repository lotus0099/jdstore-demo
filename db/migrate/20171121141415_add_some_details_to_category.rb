class AddSomeDetailsToCategory < ActiveRecord::Migration[5.0]
  def change
      add_column :categories, :category_group_id, :integer
      add_column :categories,:is_hidden, :boolean, default: false
  end
end
