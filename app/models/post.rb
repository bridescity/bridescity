class Post < Material
	belongs_to :author, :class_name => "User"
end