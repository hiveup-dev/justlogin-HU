# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Products" do
    describe "Admin" do
      describe "user_submissions", type: :feature do
        refinery_login

        describe "user_submissions list" do
          before do
            FactoryGirl.create(:user_submission, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:user_submission, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.products_admin_user_submissions_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.products_admin_user_submissions_path

            click_link "Add New User Submission"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Products::UserSubmission, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Products::UserSubmission, :count)

              expect(page).to have_content("First Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:user_submission, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.products_admin_user_submissions_path

              click_link "Add New User Submission"

              fill_in "First Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Products::UserSubmission, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:user_submission, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.products_admin_user_submissions_path

            within ".actions" do
              click_link "Edit this user submission"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            expect(page).to have_content("'A different first_name' was successfully updated.")
            expect(page).not_to have_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:user_submission, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.products_admin_user_submissions_path

            click_link "Remove this user submission forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Products::UserSubmission.count).to eq(0)
          end
        end

      end
    end
  end
end
