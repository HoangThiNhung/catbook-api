# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times.each do
  Cat.create(name: Faker::Cat.name, breed: Faker::Cat.breed, weight: rand(1..10), temperament: Faker::Cat.registry )
end

10.times.each do
  Hobby.create(name: Faker::Name.last_name)
end

Cat.all.each do |i|
  CatHobby.create(cat_id: i.id, hobby_id: rand(1..10))
end
