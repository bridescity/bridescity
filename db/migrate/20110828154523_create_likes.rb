class CreateLikes < ActiveRecord::Migration
  def self.up
    create_table :likes do |t|
      t.references :likeable, :polymorphic => true
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :likes
  end
end
