module ApplicationHelper
	def button value, options = {:class => ""}
		content_tag :button, value, options
	end

	def edit_current_user_path
		url_for(current_user) + "/edit"
	end

    def fields_values_for(record, &block)
    end

    def block(title = nil, options = {}, &content)
      options[:class] = "" if options[:class] == nil
      options[:class]  << " block"
      header = "<h4>#{title}</h4>" if title != nil
      content_tag :div, "#{header}\n#{capture(&content)} #{clear}".html_safe, options
    end

    class ValuesHelper
        include ActionView::Helpers::TagHelper
        def initialize(record)
          @record = record
        end

        def value(method)
          output = ""
          output << content_tag(:dt, @record.class.human_attribute_name(method))
          output << content_tag(:dd, @record.method(method).call)
          
          output.html_safe
           #content << content_tag :dt, record.method("attribute").call
        end
    end

    def values_for(record, &block)
        new_block = Proc.new { |a|
            helper = ValuesHelper.new(record)
            block.call(helper)
        }
        content_tag :dl, capture(&new_block), :class => 'values'
    end

    def curly_header title
        content_tag :h2, title
    end
end
