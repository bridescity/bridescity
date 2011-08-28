module ApplicationHelper
	def button value, options = {:class => ""}
		content_tag :button, value, options
	end

	def edit_current_user_path
		url_for(current_user) + "/edit"
	end
end
