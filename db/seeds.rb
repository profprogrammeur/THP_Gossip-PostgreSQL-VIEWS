require 'faker'

nb_users = 10
nb_cities = 10
nb_gossips = 5
nb_tags = 10

Faker::Config.locale = 'fr'



User.destroy_all
City.destroy_all
Tag.destroy_all
Gossip.destroy_all


# Ajout de n City à la base de données
cities_array = []
while cities_array.length < nb_cities
  city = Faker::Address.city
  cities_array << city unless cities_array.include?(city)
end
cities_array.each{ |city| City.create(name: city, zip_code: Faker::Address.zip_code) }

puts "#{nb_cities} villes ont été crées."
  
# Ajout de n User à la base de données
nb_users.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..70),
    city: City.all[i]
    )
  end

puts "#{nb_users} users ont été crées"

# Ajout de n Tag à la base de données
tags_array = []
  while tags_array.length < nb_tags
    tag = Faker::Emotion.noun
    tags_array << tag unless tags_array.include?(tag)
  end
tags_array.each{ |tag| Tag.create(title: tag) }

puts "#{nb_tags} tags ont été crées."

# Ajout de n Gossip à la base de données
nb_gossips.times do
  gossip = Gossip.create!(
  title: Faker::String.random(length: 3..14),
  content: Faker::ChuckNorris.fact,
  user_id: User.all.sample.id
  )
  puts "//////////////////////"
    rand(1..4).times do
      tag = Tag.all.sample
      gossip.tags << tag unless gossip.tags.include?(tag)
    end
  end
puts "#{nb_gossips} gossips ont été crées"



