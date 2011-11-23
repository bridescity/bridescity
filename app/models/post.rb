class Post < Material

  has_attached_file :image, :styles => {
    :giant => "660x300#",
    :large => "200x200#",
    :medium => "100x100#",
    :small => "50x50#" }

  private
    def raise_event
      Event.create(:user => self.author, :eventable => self, :type_id => Event::TYPES[:post_created])
    end

end