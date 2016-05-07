class JavascriptsController < ApplicationController
	protect_from_forgery except: :dynamic_epreuves

	def dynamic_epreuves
		@epreuves = Epreuve.all
	end
end
