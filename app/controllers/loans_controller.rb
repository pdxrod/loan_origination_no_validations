class LoansController < ApplicationController

  def index
    @loan = Loan.new
    if params["loan"]
      @loan.name = params["loan"]["name"].strip
      @loan.mailing_address = params["loan"]["mailing_address"].strip
      @loan.annual_income = params["loan"]["annual_income"].strip
      @loan.requested_loan_amount = params["loan"]["requested_loan_amount"].strip
      @loan.save!
    end
  end

end
