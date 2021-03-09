#require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Chatroom.destroy_all
Preference.destroy_all
VideosGenre.destroy_all
Genre.destroy_all
User.destroy_all
Video.destroy_all

# Users seed

User.create!(first_name: "Gaia", last_name: "Cravesana", email: "gaia@gmail.com", password: "12345678", gender: "female", age: 26, country: "Italy", admin: true, birth_date: "1994-12-19")
User.create!(first_name: "Sara", last_name: "Subtil", email: "sara@gmail.com", password: "12345678", gender: "female", age: 35, country: "Portugal", admin: true, birth_date: "1986-06-04")
eliseu = User.create!(first_name: "Eliseu", last_name: "Mateus", email: "eliseu@gmail.com", password: "12345678", gender: "male", age: 50, country: "Portugal", admin: true, birth_date: "1971-02-10")
User.create!(first_name: "Lola", last_name: "Net", email: "lola@gmail.com", password: "12345678", gender: "female", age: 37, country: "Spain", admin: false, birth_date: "1992-12-09")


# parse CSV
require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'db/top1000movies.csv'

CSV.foreach(filepath, csv_options) do |row|
  puts "#{row["Title"]} | #{row["Genre"]} | #{row["Description"]} | #{row["Year"]} | #{row["Runtime (Minutes)"]}"
  video = Video.create!(title: row["Title"], kind: "Movie")

  genres_string = row["Genre"]
  genres_string.split(",").each do |genre_name|
    genre = Genre.find_or_create_by!(name: genre_name)
    VideosGenre.create!(video_id: video.id, genre_id: genre.id)
  end
end

# 5.times do
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", gender: ["male", "female"].sample, age: 26, country: Faker::Address.country, admin: false)
#   4.times do
#     video = Video.all.sample
#     preference = Preference.create!(user: user, video: video)
#   end
#   video = Video.all.sample
#   preference = Preference.create!(user: user, video: video)
#   preference = Preference.create!(user: eliseu, video: video)
# end



