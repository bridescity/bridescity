class CreateMessage < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :read, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
