# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Products" do
    describe "Admin" do
      describe "plans", type: :feature do
        refinery_login

        describe "plans list" do
          before do
            FactoryGirl.create(:plan, :icon_name => "UniqueTitleOne")
            FactoryGirl.create(:plan, :icon_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.products_admin_plans_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.products_admin_plans_path

            click_link "Add New Plan"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Icon Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Products::Plan, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Products::Plan, :count)

              expect(page).to have_content("Icon Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:plan, :icon_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.products_admin_plans_path

              click_link "Add New Plan"

              fill_in "Icon Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Products::Plan, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:plan, :icon_name => "A icon_name") }

          it "should succeed" do
            visit refinery.products_admin_plans_path

            within ".actions" do
              click_link "Edit this plan"
            end

            fill_in "Icon Name", :with => "A different icon_name"
            click_button "Save"

            expect(page).to have_content("'A different icon_name' was successfully updated.")
            expect(page).not_to have_content("A icon_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:plan, :icon_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.products_admin_plans_path

            click_link "Remove this plan forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Products::Plan.count).to eq(0)
          end
        end

      end
    end
  end
end
