class Staff < User
	has_one :profile, :class_name => "StaffProfile", :foreign_key => "user_id"
end