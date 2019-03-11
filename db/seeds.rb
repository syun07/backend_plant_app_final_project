# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Plant.destroy_all
Garden.destroy_all

sarah = User.create(name: 'Sarah', password: 'hello')

sirfoliage = Plant.create(image:'https://secure.img1-fg.wfcdn.com/im/65997097/compr-r85/1554/15543560/silk-geranium-foliage-desk-top-plant-in-pewter-dish.jpg', name: 'Sir Foliage', breed: 'Indoor Nephtytis', summary: 'Syngonium podophyllum or the Goosefoot Plant / Nephthytis is a simple yet elegant and versatile houseplant. It has an unruly nature and tendency to creep quietly around your home (if allowed)', water_history: 'last watered on 3/10/2019', date_added: '2/21/2019')

sarah.plants << sirfoliage