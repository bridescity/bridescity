class Material < ActiveRecord::Base
	scope :draft, where(:draft => 1)
	scope :ready, where(:draft => 0)
end