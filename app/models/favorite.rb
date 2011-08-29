class Favorite < ActiveRecord::Base
  belongs_to :favorable
  belongs_to :user
end
