class BridesController < ApplicationController
	def show
		@bride = Bride.find(params[:id])
	end
end