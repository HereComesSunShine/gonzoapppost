# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    name:  "Hunter",
    email: "gonzo.admin@gmail.com",
    password:              "adminadmin",
    password_confirmation: "adminadmin",
    admin: true)

    5.times do |n|
        name = Faker::TvShows::GameOfThrones.character
        email = "1axample-#{n+1}@mail.com"
        password = "pasword"
        User.create!(name:  name,
            email: email,
            password:              password,
            password_confirmation: password,
            admin: false)
        end
        users = User.order(:email).take(5)
            5.times do
                content = Faker::TvShows::GameOfThrones.quote
                users.each { |user| user.microposts.create!(content: content) }
      end

      us = User.find_by(name: "Lemmy")
      12.times do
        cont = Faker::Quote.famous_last_words
        us.microposts.create!(content: cont)
      end