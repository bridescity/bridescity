class BrideProfilesController < ApplicationController
	def update
		@profile = current_user.profile
		respond_to do |format|
			attrs = params[:bride_profile]
			attrs[:city] = City.find_or_initialize_by_name(attrs[:city])
			attrs[:registry] = Registry.find_or_initialize_by_name(:city => attrs[:city], :name => attrs[:registry])
			
			if @profile.update_attributes(attrs)
				format.html{ redirect_to home_path }
			else
				raise @profile
			end
		end
	end
end