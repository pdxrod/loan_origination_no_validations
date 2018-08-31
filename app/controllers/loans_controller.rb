class LoansController < ApplicationController

# Parameters: "loan"=>{"name"=>"", "mailing_address"=>"", "annual_income"=>"", "requested_loan_amount"=>""}, "button"=>""}
  def index
    @loan = Loan.new
    if params["loan"]
      @loan.name = params["loan"]["name"].strip
      @loan.mailing_address = params["loan"]["mailing_address"].strip
      @loan.annual_income = params["loan"]["annual_income"].strip
      @loan.requested_loan_amount = params["loan"]["requested_loan_amount"].strip
      if @loan.save
        @loan.message = "Loan application successful"
      else
        @loan.error = "Please fill in the form completely"
      end
    end
  end

end
