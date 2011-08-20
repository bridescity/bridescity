class BrideProfile < ActiveRecord::Base
	belongs_to :user, :foreign_key => :user_id

	def full_name
		first_name << " " << last_name
	end
end
