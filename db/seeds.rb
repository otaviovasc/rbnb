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
Accommodation.create!(title: "Nice home in Jupter", address: "Jupter east coast", category: "Jupiter", price: 112, user: seller, description: "Very nice place in Jupter. The house is completely sealed and pressurized structure to protect against the planet's extreme atmospheric conditions.")
Accommodation.create!(title: "Flat in Saturn", address: "First left after the large ring", category: "Saturn", price: 123, user: buyer, description: "Very nice place in Saturn. The flat is designed to generate its own power, since solar power would not be an option in Titan's dim sunlight.")
Accommodation.create!(title: "Nice ship in Mars orbit", address: "Mars Orbit", category: "Mars", price: 230, user: bruno, description: "Very nice place in Mars. The home include hydroponic gardens or other sustainable food sources to provide for basic needs, as well as advanced water recycling systems to conserve and recycle water")
Accommodation.create!(title: "Flat in Pluto", address: "Pluto's ave, 1", category: "Pluto", price: 12.5, user: araceli, description: "Nice flat in Pluto stays in a sealed dome structure, using highly insulated materials such as ceramic or metallic composites.")
Accommodation.create!(title: "Neptune Hole", address: "Zeus street, 45", category: "Neptune", price: 101, user: otavio, description: "Very nice place in Neptune in a deep subterranean environment to protect against the extreme atmospheric conditions.")
Accommodation.create!(title: "Nice view in Mercury", address: "Solar power ave, 30", category: "Mercury", price: 320, user: vitor, description: "Very nice place in Solar power ave, 30. The house is designed to maintain a comfortable and livable environment despite the extreme conditions outside.")
puts "Accommodation created"
