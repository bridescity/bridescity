class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  validates_presence_of :body, :sender, :receiver

  def unread?
    !read
  end
end
