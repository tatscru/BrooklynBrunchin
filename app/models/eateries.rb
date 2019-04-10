class Eatery < ActiveRecord::Base 
  belongs_to :user
end 

# diner = Eatery.new 
# tatiana = User.new 

# diner.user = tatiana
# diner.user #=> tatiana

# diner.user_id = tatiana.id
# diner.eatery_id

# UserEatery
# UserEatery.table_name #=> user_eateries