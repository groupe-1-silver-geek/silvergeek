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



Device.create!([
    { name: "Wii" },
    { name: "Switch" },
    { name: "Ps2" },
    { name: "Pc" }
])

Game.create!([
    { name: "Mario Bross 2 " },
    { name: "Sonic" },
    { name: "Mii party" },
    { name: "JustDance" }
])