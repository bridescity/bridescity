class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    resource_name = resource.type.downcase
    respond_with resource, :location => redirect_location(resource_name, resource)
  end

  def destroy
    super
  end
end