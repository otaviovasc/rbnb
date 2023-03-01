puts "Cleaning database"
User.destroy_all
Accommodation.destroy_all
puts "Database cleaned"

puts "Creating users"
seller = User.create!(name: "Jão do Imóvel", home_planet: "Jupter", email: "jao@imovel.ju", password: "123132")
buyer = User.create!(name: "Klingont Sbubble", home_planet: "Saturn", email: "klingont@jupsolar.sat", password: "123123")
puts "Users created"

puts "Creating accommodation"
seller_accommodation = Accommodation.create!(title: "Nice home in Jupter", address: "Jupter east coast", category: "Floating home", user: seller)
buyer_accommodation = Accommodation.create!(title: "Flat in Saturn", address: "First left after the large ring", category: "Gas made flat", user: buyer)
puts "Accommodation created"
