module ApplicationHelper
	def button value, options = {:class => ""}
		content_tag :button, value, options
	end
end
