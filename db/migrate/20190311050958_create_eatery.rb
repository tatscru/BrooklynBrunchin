class CreateEatery < ActiveRecord::Migration[5.1]
  def change
    create_table :eateries do |t|
      t.string :name
      t.string :cuisine
      t.string :rating
      t.string :neighborhood
      t.string :url
      t.text :content
      t.string :number
      t.integer :user_id
      end
    end
  end
    
