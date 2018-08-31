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
        messages = []
        @loan.errors.messages.each do |k, v|
          messages << v[ 0 ] # e.g.  annual_income: ["Please fill in the form completely"]
        end
        messages.uniq!
        @loan.error = messages.join "\n"
        @loan.save(validate: false) # Requirements include saving every effort to apply, regardless of success
      end
    end
  end

end
