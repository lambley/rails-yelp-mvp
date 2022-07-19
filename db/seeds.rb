puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating new database from db/seeds.rb"
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )
  review_range = rand(1..5)
  review_range.times do
    review = Review.create(
      rating: rand(0..5),
      content: "#{Faker::Lorem.words(number: rand(3..8)).join(" ")} #{Faker::Lorem.multibyte}",
      restaurant_id: restaurant.id
    )
  end
  puts "created restaurant with id #{restaurant.id} and #{review_range} review(s)."
end
