module Refinery
  module Products
    class ProductFeaturesController < ::ApplicationController

      before_action :find_all_product_features
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @product_feature in the line below:
        present(@page)
      end

      def show
        @product_feature = ProductFeature.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @product_feature in the line below:
        present(@page)
      end

    protected

      def find_all_product_features
        @product_features = ProductFeature.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/product_features").first
      end

    end
  end
end
