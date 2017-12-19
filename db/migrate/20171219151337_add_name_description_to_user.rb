class AddNameDescriptionToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :description, :text
    add_column :users, :name, :string
  end
end
