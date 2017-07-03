module Refinery
  module Messages
    module Admin
      class MessagesController < ::Refinery::AdminController

        crudify :'refinery/messages/message',
                :title_attribute => 'content'

        private

        # Only allow a trusted parameter "white list" through.
        def message_params
          params.require(:message).permit(:content, :time, :user_id)
        end
      end
    end
  end
end
