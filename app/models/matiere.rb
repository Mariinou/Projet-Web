class Matiere < ActiveRecord::Base
	has_many :users_matieres
	has_many :users, through: :users_matieres
end
