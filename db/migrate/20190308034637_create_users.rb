class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :home_location 
      t.datetime :created_at
      t.datetime :updated_at 
    end 
  end
end
