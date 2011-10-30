class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable
     #:confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Associations with :likable models
  has_many :liked_posts, :through => :likes, :source => :likeable, :source_type => "Post"

  # Accociations with :favorable models
  has_many :favorite_posts, :through => :favorites, :source => :favorable, :source_type => "Post"

  # Accociations with :commentable models
  has_many :comments
  has_many :commented_posts, :through => :comments, :source => :commentable, :source_type => "Post"

  has_many :events

  def is_bride?
    type = "Bride"
  end

  def is_vendor?
    type = "Vendor"
  end

end