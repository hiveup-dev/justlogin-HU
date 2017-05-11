module ApplicationHelper

  def benefit_continue_button
    num_selected_benefits = Refinery::Products::Benefit.where(id: session[:find_out_more]).count
    button_tag('Save and Continue', type: 'button', class: "btn btn-primary submit-button next-button", disabled: num_selected_benefits <= 0, 'data-form-target' => "step1")
  end
end
