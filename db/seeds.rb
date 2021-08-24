# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[:user, :banned, :moderator, :admin].each do |role|
  Role.find_or_create_by({name: role})
end

User.create email: "admin@test.com", password: "123qwe", role: Role.find_by_name(:admin)

(1..20).each do |id|
  User.create!(
      email: "user#{id + 1}@test.com",
      password: "123qwe", 
      password_confirmation: "123qwe",
      role: Role.find_by_name(:user)
  )
end

(1..50).each do |id|
  Advert.create!(
      user_id: rand(2..20), 
      title: Faker::Device.unique.model_name, 
      status: :published,
      description: Faker::Hipster.paragraph(
        sentence_count: 4, 
        supplemental: true, 
        random_sentences_to_add: 4
      )
  )
end