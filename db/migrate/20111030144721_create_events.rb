class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.references :user
      t.references :type
      t.references :eventable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
