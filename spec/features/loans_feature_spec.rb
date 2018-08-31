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
  end

end
