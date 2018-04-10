# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

Cat.create(name: 'Bob', birthdate: '2012/12/12', color: 'brown', sex: 'M', description: 'I am a cool cat')
Cat.create(name: 'Liam', birthdate: '2012/12/12', color: 'brown', sex: 'M', description: 'I am cooler than Bob')
Cat.create(name: 'Sam', birthdate: '2012/12/12', color: 'brown', sex: 'F', description: 'Bob is cooler than me')

CatRentalRequest.create(cat: Cat.find_by(name: 'Bob'), start_date: '2018/12/12', end_date: '2018/12/21')
