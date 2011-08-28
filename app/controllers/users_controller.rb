class UsersController < ApplicationController

	def show
		@user = params[:id] ? User.find(params[:id]) : current_user
		respond_to do |format|
			format.html { render "users/#{@user.type.downcase.pluralize}/show" }
		end
	end

	def edit
		@user = params[:id] ? User.find(params[:id]) : current_user
		respond_to do |format|
			format.html { render "users/#{@user.type.downcase.pluralize}/edit" }
		end
	end

	def update
	end
end