# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

verticals = [
  { id: 1, name: 'Health & Fitness' },
  { id: 2, name: 'Business' },
  { id: 3, name: 'Music' }
]

categories = [
  { id: 1, name: 'Booty & Abs', vertical_id: 1, state: 'active' },
  { id: 2, name: 'Full Body', vertical_id: 1, state: 'active' },
  { id: 3, name: 'Advertising', vertical_id: 2, state: 'active' },
  { id: 4, name: 'Writing', vertical_id: 2, state: 'active' },
  { id: 5, name: 'Singing', vertical_id: 3, state: 'active' },
  { id: 6, name: 'Music Fundamentals', vertical_id: 3, state: 'active' }
]

courses = [
  { id: 1, name: 'Loose the Gutt, keep the Butt', author: 'Anowa', category_id: 1, state: 'active' },
  { id: 2, name: 'BrittneBabe Fitness Transformation', author: 'Brittnebabe', category_id: 1, state: 'active' },
  { id: 3, name: 'BTX: Body Transformation Extreme', author: 'Barstarzz', category_id: 2, state: 'active' },
  { id: 4, name: 'Facebook Funnel Marketing', author: 'Russell Brunson', category_id: 3, state: 'active' },
  { id: 5, name: 'Build a Wild Audience', author: 'Tim Nilson', category_id: 4, state: 'active' },
  { id: 6, name: 'Editorial Writing Secrets', author: 'J. K. Rowling', category_id: 4, state: 'active' },
  { id: 7, name: 'Scientific Writing', author: 'Stephen Hawking', category_id: 4, state: 'active' },
  { id: 8, name: 'Vocal Training 101', author: 'Linkin Park', category_id: 5, state: 'active' },
  { id: 9, name: 'Music Production', author: 'Lady Gaga', category_id: 5, state: 'active' },
  { id: 10, name: 'Learn the Piano', author: 'Lang Lang', category_id: 6, state: 'active' },
  { id: 11, name: 'Become a guitar hero', author: 'Jimmy Page', category_id: 6, state: 'active' }
]

begin
    Vertical.create!(verticals)
    Category.create!(categories)
    Course.create!(courses)
  rescue Faraday::ConnectionFailed, Elastic::Transport::Transport::Error => e
    puts "Elasticsearch is not running. Skipping Elasticsearch-related seeds."
end
