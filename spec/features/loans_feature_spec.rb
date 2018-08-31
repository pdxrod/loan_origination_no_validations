require 'rails_helper'

RSpec.describe LoansController, type: :feature do

  before do
    Loan.delete_all
  end

  describe "testing data" do
    it "should have the right data for testing" do
    end
  end

  describe "visiting loan page" do
    it "should show the loan page" do
      visit '/'
      expect(page).to have_content "Name"
    end

    it "should show an error if you don't enter anything and hit submit" do
      visit '/'
      click_on "submit"
      expect(page).to have_content "Please fill in the form completely"
      expect(page).not_to have_content "Loan application successful"
    end

    it "should not show the 'please fill in' error if you fill in the form and hit submit" do
      visit '/'
      fill_in "loan_name", with: "Rod McLaughlin"
      fill_in "loan_mailing_address", with: "16409 Division"
      fill_in "loan_annual_income", with: "1"
      fill_in "loan_requested_loan_amount", with: "1000000"
      click_on "submit"
      expect(page).not_to have_content "Please fill in the form completely"
      expect(page).to have_content "Loan application successful"
    end
  end

end
