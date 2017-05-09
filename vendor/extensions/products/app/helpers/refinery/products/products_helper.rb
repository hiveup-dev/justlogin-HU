module Refinery
  module Products
    module ProductsHelper
      def input_select_product(product, compare=false)
        checked = (!compare && session[:product_ids] && session[:product_ids].include?(product.id.to_s)) ? "checked=checked" : ''
        "<input name='product_ids[]' id='product-#{product.id}' value='#{product.id}' type='checkbox' class='input-select' #{checked}>".html_safe
      end

      def group_product_feature(products)
        sql_query = <<-eos
          SELECT "rp"."id" as id, "rppf"."name" as feature_name, "rppfp"."value" as value
          FROM "refinery_products" as "rp" 
             INNER JOIN "refinery_products_product_features_products" as "rppfp" 
                ON "rppfp"."product_id" = "rp"."id" AND "rp"."id" = ?                
             RIGHT JOIN "refinery_products_product_features" as "rppf" 
                ON "rppfp"."product_feature_id" = "rppf"."id"
          ORDER BY "rppf"."is_in_summary" DESC, "rppf"."position"
        eos
        # load product features
        product_with_features = {}
        products.each do |product|
          Refinery::Products::Product.find_by_sql([sql_query, product.id]).each do |feature|
            product_with_features[feature['feature_name']] ||= []
            product_with_features[feature['feature_name']].push(feature['value'])
          end
        end
        product_with_features
      end
    end
  end
end