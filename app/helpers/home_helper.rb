module HomeHelper
  def find_out_more_input(benefit)
    checked = session[:find_out_more] && session[:find_out_more].include?(benefit.id.to_s) ? "checked=checked" : ''
    "<input name=\"findoutmore[]\" id='#{dom_id(benefit)}' value='#{benefit.id}' class='input-select' type='checkbox' #{checked}/>".html_safe
  end
end
