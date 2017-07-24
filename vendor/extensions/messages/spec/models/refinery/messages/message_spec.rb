require 'spec_helper'

module Refinery
  module Messages
    describe Message do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:message)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
