class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|

      t.string :name
      t.string :tel
      t.string :opening_hours
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
