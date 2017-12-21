class DatePickerInput < SimpleForm::Inputs::Base
  def input(_)
    template.content_tag(:div, class: 'input-group date form_datetime') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_icon
    end
  end

  def input_html_options
    super.merge(class: 'form-control datepicker no-readonly')
  end

  def span_icon
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_date
    end
  end

  def icon_date
    "<i class='material-icons'>event</i>".html_safe
  end
end
