class Material < ActiveRecord::Base

  # before_save :associate_author

  after_save :raise_event

  belongs_to :author, :class_name => "User"
  has_many :likes, :as => :likeable
  has_many :favorites, :as => :favorable
  has_many :comments, :as => :commentable

  scope :draft, where(:draft => 1)
  scope :ready, where(:draft => 0)

  # TODO: uncomment this right down
  # private
  #   def associate_author
  #     self.author = current_user
  #   end

end