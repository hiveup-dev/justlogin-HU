module ApplicationHelper

  def benefit_continue_button
    num_selected_benefits = Refinery::Products::Benefit.where(id: session[:find_out_more]).count
    button_tag('Save and Continue', type: 'button', class: "btn btn-primary submit-button next-button", disabled: num_selected_benefits <= 0, 'data-form-target' => "step1")
  end

  def product_continue_button
    num_selected_products = Refinery::Products::Product.where(id: session[:product_ids]).count
    button_tag('Save and Continue', type: 'button', class: "btn btn-primary submit-button next-button", disabled: num_selected_products <= 0, 'data-form-target' => "step2")
  end

  def input_select_product(product, compare=false)
    checked = Refinery::Products::Product.where(id: session[:product_ids]).exists?(product.id) ? "checked=checked" : ''
    "<input name='product_ids[]' id='product-#{product.id}' value='#{product.id}' type='checkbox' class='input-select' #{checked}>".html_safe
  end

  def find_out_more_input(benefit)
    checked = session[:find_out_more] && session[:find_out_more].include?(benefit.id.to_s) ? "checked=checked" : ''
    "<input name=\"findoutmore[]\" id='#{dom_id(benefit)}' value='#{benefit.id}' class='input-select' type='checkbox' #{checked}/>".html_safe
  end

  def previous_confirm_button
    benefits = Refinery::Products::Benefit.where(id: session[:find_out_more])
    refinery.benefits_products_products_benefits_path(benefits: benefits.map(&:friendly_id))
  end
end
