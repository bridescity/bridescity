class Like < ActiveRecord::Base
  belongs_to :likeable
  belongs_to :user
end
