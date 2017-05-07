require 'spec_helper'

module Refinery
  module Products
    describe ProductFeaturesProduct do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:product_features_product)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
