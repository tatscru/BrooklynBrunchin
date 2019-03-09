class CreateEatery < ActiveRecord::Migration[5.1]
  def change
    create_table :eatery do |t|
      t.string :name
      t.string :cuisine 
      t.string :average_cost 
      #drop down 
      # t.integer :phone_number 
      # t.something :website
      # t.something :address
      #how do I input nunbers and letters
    end 
  end
end
