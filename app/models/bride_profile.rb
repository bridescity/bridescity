class BrideProfile < ActiveRecord::Base

  has_attached_file :image, :styles => {
    :large => "200x", 
    :medium => "100x100#",
    :small => "50x50#"
  }

  belongs_to :user, :foreign_key => :user_id
  belongs_to :city
  belongs_to :registry

  def city_name
    city ? city.name : ""
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def city_name
    city ? city.name : ""
  end

  def registry_name
    registry ? registry.name : ""
  end

end
