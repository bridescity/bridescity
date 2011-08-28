class CreateMaterials < ActiveRecord::Migration
  def self.up
    create_table :materials do |t|
      t.string    :type
      t.string    :title
      t.text      :content
      t.references :author
      t.boolean   :draft

      t.timestamps
    end
  end

  def self.down
      drop_table  :materials
  end
end
