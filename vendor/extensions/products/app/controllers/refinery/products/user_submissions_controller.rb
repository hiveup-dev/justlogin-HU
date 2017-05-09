module Refinery
  module Products
    class UserSubmissionsController < ::ApplicationController

      before_action :find_all_user_submissions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @user_submission in the line below:
        present(@page)
      end

      def show
        @user_submission = UserSubmission.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @user_submission in the line below:
        present(@page)
      end

    protected

      def find_all_user_submissions
        @user_submissions = UserSubmission.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/user_submissions").first
      end

    end
  end
end
