class AddTrainingCategories < ActiveRecord::Migration
  def up
    create_table :training_categories do |t|
      t.text :name
      t.text :rgb
    end

    execute 'INSERT INTO training_categories (name, rgb) VALUES (\'Red\', \'ff0000\')'
    execute 'INSERT INTO training_categories (name, rgb) VALUES (\'Yellow\', \'ffff00\')'
    execute 'INSERT INTO training_categories (name, rgb) VALUES (\'Green\', \'00ff00\')'

    add_column :devices, :training_category_id, :integer
  end

  def down
    drop_table :training_categories
    remove_column :devices, :training_category_id
  end
end
