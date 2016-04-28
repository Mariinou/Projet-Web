# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(nom: 'paul', prenom: 'choux', email: 'patate@gpol.fr', type: 'Etudiant', password: 'Patate12')
User.create!(nom: 'titeuf', prenom: 'cool', email: 'prof@lycee.com', type: 'Enseignant', password: 'Prof31')
User.create!(nom: 'dupont', prenom: 'bois', email: 'admin@force.fr', type: 'Administrateur', password: 'thebest')