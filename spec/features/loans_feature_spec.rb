require 'rails_helper'

RSpec.describe LoansController, type: :feature do

  def fill_in_with_too_low_loan_amount
    fill_in "loan_name", with: "Rod McLaughlin"
    fill_in "loan_mailing_address", with: "16409 Division"
    fill_in "loan_annual_income", with:       "200000"
    fill_in "loan_requested_loan_amount", with: "4999"
  end

  def fill_in_with_absolutely_too_high_loan_amount
    fill_in "loan_name", with: "Rod McLaughlin"
    fill_in "loan_mailing_address", with: "16409 Division"
    fill_in "loan_annual_income", with:        "200000"
    fill_in "loan_requested_loan_amount", with: "50001"
  end

  def fill_in_with_too_high_loan_amount_for_income
    fill_in "loan_name", with: "Rod McLaughlin"
    fill_in "loan_mailing_address", with: "16409 Division"
    fill_in "loan_annual_income", with:         "50000"
    fill_in "loan_requested_loan_amount", with: "15001"
  end

  def fill_in_with_adequate_income_and_loan_amount
    fill_in "loan_name", with: "Rod McLaughlin"
    fill_in "loan_mailing_address", with: "16409 Division"
    fill_in "loan_annual_income", with:         "50000"
    fill_in "loan_requested_loan_amount", with: "15000"
  end

  def fill_in_with_zeros
    fill_in "loan_name", with: "Rod McLaughlin"
    fill_in "loan_mailing_address", with: "16409 Division"
    fill_in "loan_annual_income", with:         "0"
    fill_in "loan_requested_loan_amount", with: "0"
  end

  describe "visiting loan page" do
    it "should show the loan page" do
      visit '/'
      expect(page).to have_content "Name"
    end

    it "should show 'please fill in' if you don't enter anything and hit submit" do
      visit '/'
      click_on "submit"
      expect(page).to have_content "Please fill in the form completely"
      expect(page).not_to have_content "Loan application successful"
      expect(page).not_to have_content "Loan application unsuccessful"
    end

    it "should show 'please fill in' if you enter zeros and hit submit" do
      visit '/'
      fill_in_with_zeros
      click_on "submit"
      expect(page).to have_content "Please fill in the form completely"
      expect(page).not_to have_content "Loan application successful"
      expect(page).not_to have_content "Loan application unsuccessful"
    end

    it "should show 'successful' if you fill in the form with adequate information and hit submit" do
      visit '/'
      fill_in_with_adequate_income_and_loan_amount
      click_on "submit"
      expect(page).not_to have_content "Please fill in the form completely"
      expect(page).not_to have_content "Loan application unsuccessful"
      expect(page).to have_content "Loan application successful"
    end

    it "should show 'unsuccessful' if you enter too low loan amount and hit submit" do
      visit '/'
      fill_in_with_too_low_loan_amount
      click_on "submit"
      expect(page).not_to have_content "Please fill in the form completely"
      expect(page).to have_content "Loan application unsuccessful"
      expect(page).not_to have_content "Loan application successful"
    end

    it "should show 'unsuccessful' if you enter absolutely too high loan amount and hit submit" do
      visit '/'
      fill_in_with_absolutely_too_high_loan_amount
      click_on "submit"
      expect(page).not_to have_content "Please fill in the form completely"
      expect(page).to have_content "Loan application unsuccessful"
      expect(page).not_to have_content "Loan application successful"
    end

    it "should show 'unsuccessful' if you enter too high loan amount for your income and hit submit" do
      visit '/'
      fill_in_with_too_high_loan_amount_for_income
      click_on "submit"
      expect(page).not_to have_content "Please fill in the form completely"
      expect(page).to have_content "Loan application unsuccessful"
      expect(page).not_to have_content "Loan application successful"
    end

    it "should save the application if you fill in the form with adequate information and hit submit" do
      n = Loan.count
      visit '/'
      fill_in_with_adequate_income_and_loan_amount
      click_on "submit"
      expect(Loan.count).to eq n + 1
    end

    it "should always persist the data if you hit submit, even if you don't fill it in correctly" do
      n = Loan.count
      visit '/'
      fill_in "loan_name", with: "Rod McLaughlin"
      click_on "submit"
      expect(Loan.count).to eq n + 1
    end

  end
end
