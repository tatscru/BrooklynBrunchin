class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do 
      t.string :name
      t.string :home_location 
  end
end
