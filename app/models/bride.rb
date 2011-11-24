class Bride < User
    has_one :profile, 
            :class_name => "BrideProfile", 
            :foreign_key => :user_id, 
            :autosave => true,
            :dependent => :destroy

    # Friends
    has_many :friendships, :class_name  => "Friendship", :foreign_key => 'inviter_id', :conditions => "`friendships`.status = #{Friendship::ACCEPTED}"
    has_many :received_friendship_requests, :class_name => "Friendship", :foreign_key => "invited_id", :conditions => "`friendships`.status = #{Friendship::PENDING}"
    has_many :sent_friendship_requests, :class_name => "Friendship", :foreign_key => "inviter_id", :conditions => "`friendships`.status = #{Friendship::PENDING}"

    has_many :friends, :through => :friendships, :source => :invited
    has_many :followers, :through => :received_friendship_requests, :source => :inviter
    has_many :followings, :through => :following_friends, :source => :invited

    attr_accessible :profile_attributes
    accepts_nested_attributes_for :profile, :allow_destroy => :true

    def followed_by? user
        followers.find(user.id) rescue nil
    end
end
