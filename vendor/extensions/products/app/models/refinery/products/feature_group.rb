module Refinery
  module Products
    class FeatureGroup < Refinery::Core::BaseModel

      has_many :product_features, :foreign_key => 'feature_group_id'

      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
