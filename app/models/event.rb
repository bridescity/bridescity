class Event < ActiveRecord::Base
  TYPES = {
    :comment_created => 1,
    :post_created => 2,
    :company_recommended => 3,
    :photo_created => 4,
    :discussion_created => 5,
    :meeting_created => 6,
    :meeting_joined => 7,
    :favorite_created => 8,
    :like_created => 9,
    :review_created => 10
  }

  belongs_to :user
  belongs_to :eventable, :polymorphic => true

  def partial
    TYPES.invert[self.type_id].to_s
  end
end
