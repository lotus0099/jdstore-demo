class CreateCategoryGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :category_groups do |t|
        t.string   :name
        t.boolean  :is_hidden,default: false
        t.string   :logo
        t.text     :description
        t.string   :image
        t.timestamps
    end
  end
end
