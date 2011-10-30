class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :inviter_id
      t.integer :invited_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :friendships
  end
end