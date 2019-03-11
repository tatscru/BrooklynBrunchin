class CreateEatery < ActiveRecord::Migration[5.1]
  def change
    create_table :eateries do |t|
      t.string :name
      t.string :cuisine
      t.string :rating
      t.text :content
      t.integer :number
      t.integer :user_id
      end
    end
  end
    
