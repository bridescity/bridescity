class Material < ActiveRecord::Base

  # before_save :associate_author

  scope :draft, where(:draft => 1)
  scope :ready, where(:draft => 0)

  # TODO: uncomment this right down
  # private
  #   def associate_author
  #     self.author = current_user
  #   end

end