module Refinery
  module Products
    class BenefitsController < ::ApplicationController

      before_action :find_all_benefits
      before_action :find_page

      def products
        @benefit_names = params[:benefits].split('/')
        @benefits = @benefits.where(slug: @benefit_names)
        @products = Product.where(benefit_id: @benefits.map(&:id))
                           .order('position ASC').includes(product_feature_products: :product_feature)

      end

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @benefit in the line below:
        present(@page)
      end

      def show
        @benefit = Benefit.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @benefit in the line below:
        present(@page)
      end

    protected

      def find_all_benefits
        @benefits = Benefit.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/benefits").first
      end

    end
  end
end
