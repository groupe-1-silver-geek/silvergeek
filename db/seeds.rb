# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default admin user

user = User.where(email: "example@test.fr").first_or_initialize
user.password = "password"
user.admin =  true
user.save

["Wii", "Switch", "Ps2", "Pc"].each do |device_name|
    Device.find_or_create_by!(name: device_name)
end

["Mario Bross", "Sonic", "Mii party", "JustDance"].each do |game_name|
    Game.find_or_create_by!(name: game_name)
end

["Auvergne-Rhône-Alpes",
"Bourgogne-Franche-Comté",
"Bretagne",
"Centre-Val de Loire",
"Corse",
"Grand Est",
"Hauts-de-France",
"Île-de-France",
"Normandie",
"Nouvelle-Aquitaine",
"Occitanie",
"Pays de la Loire",
"Provence-Alpes-Côte d'Azur",
"Guadeloupe",
"Martinique",
"Guyane",
"La Réunion",
"Mayotte"].each do |region_name|
    Region.find_or_create_by!(name: region_name)
end

