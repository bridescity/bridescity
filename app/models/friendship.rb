class Friendship < ActiveRecord::Base
  belongs_to :inviter, :class_name => "User"
  belongs_to :invited, :class_name => "User"

  ACCEPTED = 1
  PENDING = 0

  class << self
    def request(inviter, invited)
      a = Friendship.create(:inviter => inviter, :invited => invited, :status => PENDING)
      !a.new_record?
    end

    def make_friends(user, target)
      transaction do
        begin
          Friendship.first(:conditions => {:inviter_id => user.id, :invited_id => target.id, :status => PENDING}).update_attribute(:status, ACCEPTED)
          Friendship.create!(:inviter_id => target.id, :invited_id => user.id, :status => ACCEPTED)
        rescue Exception
          return make_friends(target, user) if user.followed_by? target
          return request(user, target)
        end
      end
      true
    end

    def stop_being_friends(user, target)
      transaction do
        begin
          Friendship.first(:conditions => {:inviter_id => user.id, :invited_id => target.id, :status => ACCEPTED}).destroy
          Friendship.first(:conditions => {:inviter_id => target.id, :invited_id => user.id, :status => ACCEPTED}).destroy
        rescue Exception
            return false
         end
      end
      true
    end

    def friends? (user1, user2)
      Friendship.first(:conditions => {:inviter_id => user1.id, :invited_id => user2.id, :status => ACCEPTED})
    end
  end
end