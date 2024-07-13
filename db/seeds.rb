require 'open-uri'


Pokemon.destroy_all
User.destroy_all


def attach_image(pokemon, image_url)
  file = URI.open(image_url)
  pokemon.image.attach(io: file, filename: File.basename(file.path))
end


users = [
  { email: 'ash@example.com', password: 'password', balance: 100.0 },
  { email: 'misty@example.com', password: 'password', balance: 150.0 },
  { email: 'brock@example.com', password: 'password', balance: 120.0 }
]

users.each do |user_data|
  User.create!(user_data)
end

pokemons = [
  { name: 'Pikachu', weight: 60, height: 4, price: 10.0, image_url: 'https://allroundclub.com/blog/wp-content/uploads/2021/10/how-to-draw-pikachu.png' },
  { name: 'Charmander', weight: 85, height: 6, price: 15.0, image_url: 'https://allroundclub.com/blog/wp-content/uploads/2021/10/how-to-draw-pikachu.png' },
  { name: 'Bulbasaur', weight: 69, height: 7, price: 12.0, image_url: 'https://allroundclub.com/blog/wp-content/uploads/2021/10/how-to-draw-pikachu.png' },
  { name: 'Squirtle', weight: 90, height: 5, price: 14.0, image_url: 'https://allroundclub.com/blog/wp-content/uploads/2021/10/how-to-draw-pikachu.png' },
  { name: 'Jigglypuff', weight: 55, height: 5, price: 8.0, image_url: 'https://allroundclub.com/blog/wp-content/uploads/2021/10/how-to-draw-pikachu.png' }
]


user_ids = User.pluck(:id)

pokemons.each_with_index do |pokemon_data, index|
  pokemon = Pokemon.create!(
    name: pokemon_data[:name],
    weight: pokemon_data[:weight],
    height: pokemon_data[:height],
    price: pokemon_data[:price],
    user_id: user_ids[index % user_ids.length] 
  )
  attach_image(pokemon, pokemon_data[:image_url])
end

puts "Seeded #{User.count} users and #{Pokemon.count} pokemons."
