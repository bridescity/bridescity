class Comment < ActiveRecord::Base

  after_save :raise_event

  has_ancestry

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates_presence_of :content

  def raise_event
    Event.create(:user => self.user, :eventable => self, :type_id => Event::TYPES[:comment_created])
  end

end
