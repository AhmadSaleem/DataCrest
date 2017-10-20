module ApplicationViewHelper
  def render_input_html(application_form)
    return application_form.send(application_form.object.field_type, :value) if application_form.object.check_box?
    if application_form.object.radio_button?
      return application_form.send(application_form.object.field_type, :value, "Yes")+ " Yes " +
             application_form.send(application_form.object.field_type, :value, "No")+ " No"
    end
    return application_form.send(application_form.object.field_type, :value , class: "form-control")
  end
end
