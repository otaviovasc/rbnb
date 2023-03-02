puts "Cleaning database"
User.destroy_all
Accommodation.destroy_all
puts "Database cleaned"

puts "Creating users"
seller = User.create!(name: "Jão do Imóvel", home_planet: "Jupter", email: "jao@imovel.ju", password: "123123")
buyer = User.create!(name: "Klingont Sbubble", home_planet: "Saturn", email: "klingont@jupsolar.sat", password: "123123")
bruno = User.create!(name: "bruno", home_planet: "Mars", email: "bruno@teste", password: "123123")
araceli = User.create!(name: "araceli", home_planet: "Pluto", email: "araceli@teste.com", password: "123123")
otavio = User.create!(name: "Otavio", home_planet: "Neptune", email: "otavio@teste.com", password: "123123")
vitor = User.create!(name: "Vitor", home_planet: "Pluto", email: "vitor@teste.com", password: "123123")

puts "Users created"

puts "Creating accommodation"
Accommodation.create!(title: "Nice home in Jupter", address: "Jupter east coast", category: "Floating home", price: 112, user: seller, description: "Very nice place in Jupter")
Accommodation.create!(title: "Flat in Saturn", address: "First left after the large ring", category: "Gas made flat", price: 123, user: buyer, description: "Very nice place in Saturn")
Accommodation.create!(title: "Nice ship in Mars orbit", address: "Mars Orbit", category: "Space Ship", price: 230, user: bruno, description: "Very nice place in Mars")
Accommodation.create!(title: "Flat in Pluto", address: "Pluto's ave, 1", category: "Gas made flat", price: 12.5, user: araceli, description: "Very place home in Pluto")
Accommodation.create!(title: "Neptune Hole", address: "Neptune", category: "TesteCategory", price: 101, user: otavio, description: "Very nice place in Neptune")
Accommodation.create!(title: "Teste2", address: "Pluto's ave, 2", category: "TesteCategory", price: 32, user: vitor, description: "Very nice place in Pluto's ave 2")
puts "Accommodation created"
