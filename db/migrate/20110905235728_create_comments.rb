class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references  :commentable, :polymorphic => true
      t.references  :user
      t.text        :content
      t.string      :ancestry

      t.timestamps
    end
    add_index :comments, :ancestry
  end

  def self.down
    drop_table :comments
  end
end
