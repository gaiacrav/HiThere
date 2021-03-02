# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users seed

User.create!(first_name: "Gaia", last_name: "Cravesana", email: "gaia@gmail.com", password: "12345678", gender: "female", age: 26, admin: true)
User.create!(first_name: "Sara", last_name: "Subtil", email: "sara@gmail.com", password: "12345678", gender: "female", age: 35,admin: true)
User.create!(first_name: "Eliseu", last_name: "Mateus", email: "eliseu@gmail.com", password: "12345678", gender: "male", age: 50, admin: true)
User.create!(first_name: "Lola", last_name: "Net", email: "lola@gmail.com", password: "12345678", gender: "female", age: 37, admin: false)
