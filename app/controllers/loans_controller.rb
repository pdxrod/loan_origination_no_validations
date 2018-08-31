class LoansController < ApplicationController

# Parameters: "loan"=>{"name"=>"", "mailing_address"=>"", "annual_income"=>"", "requested_loan_amount"=>""}, "button"=>""}
  def index
    if params["loan"]
      if Loan.validate_params( params["loan"] )

      else
        @loan = Loan.new
        @loan.error = "Please fill in the form completely"
      end
    else
      @loan = Loan.new
    end
  end

end
