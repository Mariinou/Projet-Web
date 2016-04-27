# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'patate@gpol.fr', type: 'Etudiant', password: 'Patate12')
User.create!(email: 'prof@lycee.com', type: 'Enseignant', password: 'Prof31')
User.create!(email: 'admin@force.fr', type: 'Administrateur', password: 'thebest')