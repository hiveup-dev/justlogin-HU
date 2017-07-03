module Refinery
  module Messages
    class Message < Refinery::Core::BaseModel
      self.table_name = 'refinery_messages'


      validates :content, :presence => true

      belongs_to :refinery_user, class_name: 'Refinery::Authentication::Devise::User', :foreign_key => 'user_id'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
