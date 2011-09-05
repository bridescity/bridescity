# f.input(:body, :as => :autocomplete)
class AutocompleteInput < Formtastic::Inputs::StringInput
  def input_html_options
      current_value = @object.method(method).call
      value = current_value ? current_value.method(@options[:on]).call : ""
      id = current_value.id rescue nil
      
    	super.merge(
    		:class => "mf-autocomplete",
    		:"data-source" => @options[:source],
        :value => value,
        :"data-item.customcomplete" => {:value => value, :id => id}.to_json
    	)
    end
end