class Registry < ActiveRecord::Base
	has_many :bride_profiles
	has_many :brides, :through => :bride_profiles
	belongs_to :city
end
