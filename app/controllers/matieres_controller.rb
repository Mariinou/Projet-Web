class MatieresController < ApplicationController
	def new
		@matiere = Matiere.new
	end
end
