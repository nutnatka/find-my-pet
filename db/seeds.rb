# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Place.create!([
                { name: 'Buckingham Palace', latitude: 51.501564, longitude: -0.141944 },
                { name: 'Westminster Abbey', latitude: 51.499581, longitude: -0.127309 },
                { name: 'Big Ben', latitude: 51.500792, longitude: -0.124613 }
              ])

Category.create!([
                { name: 'lost_pets', id: '8' },
                { name: 'found_pets', id: '9' },
                { name: 'pets_to_adopt', id: '10'},
                { name: 'success_stories', id: '11'},
                { name: 'recommendations', id: '12'}
              ])
