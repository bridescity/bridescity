class City < ActiveRecord::Base
	has_many :bride_profiles
	has_many :brides, :through => :bride_profiles
	has_many :registries
end
