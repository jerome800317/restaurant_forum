class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|

      t.string :name

      t.timestamps
    end

    #在同一次migration中, 同時呼叫其他migration方法, 可不必再另外建立migration的檔案
    add_column :restaurants, :category_id, :integer
  end
end
