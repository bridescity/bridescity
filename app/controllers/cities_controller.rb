class CitiesController < ApplicationController
	def index
		if params[:term]
			@cities = City.where("name LIKE ?", "#{params[:term]}%")
		else
		end
		
		respond_to do |format|
			format.js {
				render :json => @cities.map{|i| {:value => i.name, :id => i.id}}
			}
		end
	end
end
