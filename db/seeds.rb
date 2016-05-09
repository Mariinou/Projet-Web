# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(nom: 'paul', prenom: 'choux', email: 'patate@gpol.fr', type: 'Etudiant', password: 'Patate12', approved: true)
User.create!(nom: 'titeuf', prenom: 'cool', email: 'prof@lycee.com', type: 'Enseignant', password: 'Prof31', approved: true)
User.create!(nom: 'dupont', prenom: 'bois', email: 'admin@force.fr', type: 'Administrateur', password: 'thebest', approved: true)
Matiere.create!(titre: 'Mathématiques', debut: DateTime.strptime("02/09/2016","%d/%m/%Y"), fin: DateTime.strptime("02/01/2017","%d/%m/%Y"), user_id: User.where(nom: 'titeuf').where(prenom: 'cool').ids)
