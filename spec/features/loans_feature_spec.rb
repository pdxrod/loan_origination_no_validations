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
    end
  end

end
