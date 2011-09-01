class Post < Material
	belongs_to :author, :class_name => "User"
	has_many :likes, :as => :likeable
	has_many :favorites, :as => :favorable
end