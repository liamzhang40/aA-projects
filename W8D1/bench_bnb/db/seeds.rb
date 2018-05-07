# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all

Bench.create!(description: "InterContinental Hopkins Bench", lat: 37.791307, lng: -122.410381)
Bench.create!(description: "InterContinental SF Bench", lat: 37.781777, lng: -122.404903)
Bench.create!(description: "Doubletree Hilton Bench", lat: 37.672376, lng: -122.387512)
