class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :name
    end

    add_column :devices, :category_id, :integer
  end
end
