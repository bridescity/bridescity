class BrideProfilesController < ApplicationController
	def update
		@profile = current_user.profile
		
		respond_to do |format|
			@profile.update_attributes(params[:bride_profile])
		end
	end
end
