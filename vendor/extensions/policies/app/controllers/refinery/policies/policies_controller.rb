module Refinery
  module Policies
    class PoliciesController < ::ApplicationController

      before_action :find_all_policies
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy in the line below:
        present(@page)
      end

      def show
        @policy = Policy.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @policy in the line below:
        respond_to do |format|
          format.html # show.html.erb
          format.js # show.js.erb
          format.json { render json: @book}
        end
      end

    protected

      def find_all_policies
        @policies = Policy.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/policies").first
      end

    end
  end
end
