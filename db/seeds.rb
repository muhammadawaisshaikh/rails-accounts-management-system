# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'looking up Super_admin ...'
unless Admin.where(email: 'admin@shopkeryar.com').exists?
  puts 'not found'
  puts 'creating one...'
  admin = Admin.new(email: 'admin@shopkeryar.com')
  admin.password = 'Shopkeryar1234'
  admin.save!
end