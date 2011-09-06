class Post < Material

  has_attached_file :image, :styles => {
    :giant => "660x300#",
    :large => "200x200#",
    :medium => "100x100#",
    :small => "50x50#" }

  belongs_to :author, :class_name => "User"
  has_many :likes, :as => :likeable
  has_many :favorites, :as => :favorable
  has_many :comments, :as => :commentable

end