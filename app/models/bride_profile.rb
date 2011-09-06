class BrideProfile < ActiveRecord::Base

  belongs_to :user, :foreign_key => :user_id
  belongs_to :city
  belongs_to :registry

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
