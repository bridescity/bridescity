class RegistriesController < ApplicationController	
	def index
		if params[:term]
			@registries = Registry.where("name LIKE ?", "#{params[:term]}%")
		else
		end
		
		respond_to do |format|
			format.js {render :json => @registries.map{|i| i.name}}
		end
	end
end