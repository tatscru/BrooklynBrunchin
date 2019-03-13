tyler = User.create({ email: 'tyler@tyler.love', username: 'tyler', password_digest: '$2a$10$Z.pk3t4qx7DKrg2.XBelW.Ekev0c6to4JPckNk9QX4DtCmE1dBbtW' })

eateries = [
  { name: "Sushi Good", neighborhood: "Sushi Town, USA", cuisine: "Mexican", rating: 4, content: "It's a'ight. Not what I expected", number: 5598027576, url: "http://www.sushigood.com" }
]

eateries.each{|eatery| tyler.eateries.create(eatery) }

