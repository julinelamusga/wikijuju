user = User.new(name: Faker::Name.name, 
                   email: "premium@example.com",
                   password: "helloworld",
                   password_confirmation: "helloworld")
user.premium = true
user.skip_confirmation!
user.save

wiki = user.wikis.build(name: "Premium JuJu")
wiki.premium = true
wiki.save

wiki = user.wikis.create(name: "Public JuJu")


user = User.create(name: Faker::Name.name, 
                   email: "public@example.com",
                   password: "helloworld",
                   password_confirmation: "helloworld")
user.skip_confirmation!
user.save

wiki = user.wikis.create(name: "Public user's Public JuJu")

puts "Create 2 users, 1 non-premium and 1 premium"
puts "Create 3 wikis"