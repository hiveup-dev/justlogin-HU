module HomeHelper
  def find_out_more_input(value)
    checked = session[:find_out_more] && session[:find_out_more].include?(value) ? "checked=checked" : ''
    "<input name=\"findoutmore[]\" value='#{value}' class='input-select' type='checkbox' #{checked}/>".html_safe
  end
end
