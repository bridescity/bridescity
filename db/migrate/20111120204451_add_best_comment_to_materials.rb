class AddBestCommentToMaterials < ActiveRecord::Migration
  def self.up
    add_column :materials, :best_comment, :reference
  end

  def self.down
    remove_column :materials, :best_comment
  end
end
