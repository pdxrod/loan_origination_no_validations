require 'rails_helper'

RSpec.describe Loan, type: :model do

  before do
    Loan.delete_all
  end

  describe "loan" do

    it "uses the negative_zero_or_empty? method which works" do
      require File.expand_path('../../../app/helpers/loans_helper', __FILE__)
      expect("".negative_zero_or_empty?).to be true
      expect(0.negative_zero_or_empty?).to be true
      expect(0.0.negative_zero_or_empty?).to be true
      expect(" ".negative_zero_or_empty?).to be true
      expect(nil.negative_zero_or_empty?).to be true
      expect("Jim".negative_zero_or_empty?).to be false
      expect(10.negative_zero_or_empty?).to be false
    end

    it "saves a loan with none of its columns filled in" do
      Loan.new.save!
    end

    it "saves a loan with all of its columns filled in with adequate values, and shows a message" do
      loan = Loan.new
      loan.name = "Rod"
      loan.mailing_address = "16409 Division"
      loan.annual_income   =       "50000"
      loan.requested_loan_amount = "15000"
      expect(loan.save).to be true
      expect(loan.error).to eq ""
      expect(loan.message).to eq "Loan application successful"
    end

    it "saves a loan with some of its columns filled in, but shows an error" do
      n = Loan.count
      loan = Loan.new
      loan.annual_income = "1"
      loan.name = "Rod"
      loan.save
      expect(loan.error).to eq "Please fill in the form completely"
      expect(Loan.count).to eq n + 1
    end
  end

end
