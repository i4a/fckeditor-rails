module Fckeditor
  module Helpers
    module Textarea

      def fckeditor_textarea(object, field, options = {})
        cols = options.fetch(:cols) { nil }
        rows = options.fetch(:rows) { nil }
        width  = options.fetch(:width)  { '100%' }
        height = options.fetch(:height) { '100%' }
        toolbarSet = options.fetch(:toolbarSet) { 'Default' }

        var = instance_variable_get("@#{object}")

        if var
          value = "#{var.send(field.to_sym)}"
        else
          value = ''
          klass = "#{object}".camelcase.constantize
          instance_variable_set("@#{object}", eval("#{klass}.new()"))
        end

        id = fckeditor_element_id(object, field)

        cols = "cols='#{cols}'" if cols
        cols = "rows='#{rows}'" if rows

        inputs =
          if options[:ajax]
            <<-HTML
            <input type='hidden' id='#{id}_hidden' name='#{object}[#{field}]'>
            <textarea id='#{id}' #{cols} #{rows} name='#{id}'>#{value}</textarea>
            HTML
          else
            <<-HTML
            <textarea id='#{id}' #{cols} #{rows} name='#{object}[#{field}]'>#{value}</textarea>
            HTML
          end

        javascript = javascript_tag(
          <<-JAVASCRIPT
          var oFCKeditor = new FCKeditor('#{id}', '#{width}', '#{height}', '#{toolbarSet}');
          oFCKeditor.BasePath = "#{asset_path('/')}";
          oFCKeditor.Config['CustomConfigurationsPath'] = '#{asset_path('fckcustom.js')}';
          oFCKeditor.ReplaceTextarea();
          JAVASCRIPT
        )

        inputs + javascript
      end

    end
  end
end
