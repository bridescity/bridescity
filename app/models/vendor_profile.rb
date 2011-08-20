class VendorProfile < ActiveRecord::Base
	belongs_to :user, :foreign_key => :user_id

	def full_name
		name
	end
end
