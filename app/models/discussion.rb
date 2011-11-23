class Discussion < Material

  has_one :best_comment, :as => :commentable

  private
    def raise_event
      Event.create(:user => self.author, :eventable => self, :type_id => Event::TYPES[:discussion_created])
    end

end