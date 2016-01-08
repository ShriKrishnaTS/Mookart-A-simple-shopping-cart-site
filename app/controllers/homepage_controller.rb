class HomepageController < ApplicationController
	def view
		@id = params[:product_id]
	end
end
