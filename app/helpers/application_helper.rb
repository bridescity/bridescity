module ApplicationHelper
	def button value, options = {}
    options[:type] = "button"
    options[:value] = value
    content_tag :input, "", options
	end

	def edit_current_user_path
		url_for(current_user) + "/edit"
	end

    def fields_values_for(record, &block)
    end

    def block(title = nil, options = {}, &content)
      options[:class] = "" if options[:class] == nil
      options[:class]  << " block"
      header = (content_tag :h4, title) if title != nil
      content_tag :div, "#{header}\n#{capture(&content)} #{clear}".html_safe, options
    end

    class ValuesHelper
        include ActionView::Helpers::TagHelper
        def initialize(record)
          @record = record
        end

        def value(method)
          val = @record.method(method).call
          if val && val != ""
            output = ""
            output << content_tag(:dt, @record.class.human_attribute_name(method))
            output << content_tag(:dd, @record.method(method).call)
          
            output.html_safe
          end
        end
    end

    def values_for(record, &block)
        new_block = Proc.new { |a|
            helper = ValuesHelper.new(record)
            block.call(helper)
        }
        content_tag :dl, capture(&new_block), :class => 'values'
    end

    def curly_header(title = "Curly header", options = {})
      options[:class] = "" if options[:class] == nil
      options[:class]  << " curly_header"
      data = "<span class='wrapper'><span class='curl_left'></span>"<< content_tag(:span, title, :class => "curl_middle") << "<span class='curl_right'></span></span>"
      content_tag :h2, data.html_safe, options
    end

    def js_link(title = "Curly header", options = {})
      options[:class] ||= ""
      options[:class]  << " js_link"
      content_tag :span, title, options
    end

end
