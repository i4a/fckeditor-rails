module Fckeditor
  module Helpers
    module Remote

      def fckeditor_form_remote_tag(options = {})
        editors = options[:editors]
        before = ''
        editors.each do |key, value|
          before += fckeditor_before_js(e, f)
        end
        options[:before] = options[:before].nil? ? before : before + options[:before]
        form_remote_tag(options)
      end

      def fckeditor_remote_form_for(object_name, *args, &proc)
        options = args.last.is_a?(Hash) ? args.pop : {}
        concat(fckeditor_form_remote_tag(options), proc.binding)
        fields_for(object_name, *(args << options), &proc)
        concat('</form>', proc.binding)
      end
      alias_method :fckeditor_form_remote_for, :fckeditor_remote_form_for

      def fckeditor_element_id(object, field)
        id = eval("@#{object}.id")
        "#{object}_#{id}_#{field}_editor"
      end

      def fckeditor_div_id(object, field)
        id = eval("@#{object}.id")
        "div-#{object}-#{id}-#{field}-editor"
      end

      def fckeditor_before_js(object, field)
        id = fckeditor_element_id(object, field)
        <<-JAVASCRIPT
        var oEditor = FCKeditorAPI.GetInstance('#{id}');
        document.getElementById('#{id}_hidden').value = oEditor.GetXHTML();
        JAVASCRIPT
      end

    end
  end
end
