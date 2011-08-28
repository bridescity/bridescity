class Bride < User
	has_one :profile, 
			:class_name => "BrideProfile", 
			:foreign_key => :user_id, 
			:autosave => true,
			:dependent => :destroy

	attr_accessible :profile_attributes
	accepts_nested_attributes_for :profile, :allow_destroy => :true
end
