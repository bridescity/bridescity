class Post < Material

  after_save :raise_event

  has_attached_file :image, :styles => {
    :giant => "660x300#",
    :large => "200x200#",
    :medium => "100x100#",
    :small => "50x50#" }

  belongs_to :author, :class_name => "User"
  has_many :likes, :as => :likeable
  has_many :favorites, :as => :favorable
  has_many :comments, :as => :commentable

  def raise_event
    Event.create(:user => self.author, :eventable => self, :type_id => Event::TYPES[:post_created])
  end

end