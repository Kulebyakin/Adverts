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

User.create email: "admin@example.com", password: "123qwe", role: Role.find_by_name(:admin)

(1..20).each do |id|
  User.create!(
      email: "user#{id + 1}@example.com",
      password: "123qwe", 
      password_confirmation: "123qwe",
      role: Role.find_by_name(:user)
  )
end

Category.create title: "Real estate"
Category.create title: "Services"
Category.create title: "Electronic"
Category.create title: "Apliance"
Category.create title: "Hobby"
appartments = Category.create title: "Appartments", parent_category: Category.find_by_title("Real estate")
homes = Category.create title: "Homes", parent_category: Category.find_by_title("Real estate")
lands = Category.create title: "Lands", parent_category: Category.find_by_title("Real estate")
gardening = Category.create title: "Gardening", parent_category: Category.find_by_title("Services")
beautiful = Category.create title: "Beautiful", parent_category: Category.find_by_title("Services")
tatoo = Category.create title: "Tatoo", parent_category: Category.find_by_title("Services")
transportation = Category.create title: "Transportation", parent_category: Category.find_by_title("Services")
desktops = Category.create title: "Desktops", parent_category: Category.find_by_title("Electronic")
laptops = Category.create title: "Laptops", parent_category: Category.find_by_title("Electronic")
smartphones = Category.create title: "Smartphones", parent_category: Category.find_by_title("Electronic")
photoVideo = Category.create title: "PhotoVideo", parent_category: Category.find_by_title("Electronic")
vacuums = Category.create title: "Vacuums", parent_category: Category.find_by_title("Apliance")
dishwashers = Category.create title: "Dishwashers", parent_category: Category.find_by_title("Apliance")
washers = Category.create title: "Washers", parent_category: Category.find_by_title("Apliance")
dryers = Category.create title: "Dryers", parent_category: Category.find_by_title("Apliance")
conditioners = Category.create title: "Conditioners", parent_category: Category.find_by_title("Apliance")
bikes = Category.create title: "Bikes", parent_category: Category.find_by_title("Hobby")
books = Category.create title: "Books", parent_category: Category.find_by_title("Hobby")
guitars = Category.create title: "Guitars", parent_category: Category.find_by_title("Hobby")
hiking = Category.create title: "Hiking", parent_category: Category.find_by_title("Hobby")
collectioning = Category.create title: "Collectioning", parent_category: Category.find_by_title("Hobby")

categories = [
  appartments,
  homes,
  lands,
  gardening,
  beautiful,
  tatoo,
  transportation,
  desktops,
  laptops,
  smartphones,
  photoVideo,
  vacuums,
  dishwashers,
  washers,
  dryers,
  conditioners,
  bikes,
  books,
  guitars,
  hiking,
  collectioning
]

(1..50).each do |id|
  Advert.create!(
      user_id: rand(2..20), 
      title: Faker::Device.unique.model_name, 
      status: :published,
      categories: categories.sample(1),
      description: Faker::Hipster.paragraph(
        sentence_count: 4, 
        supplemental: true, 
        random_sentences_to_add: 4
      )
  )
end