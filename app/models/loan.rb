
require File.expand_path('../../helpers/loans_helper', __FILE__)
include LoansHelper

class Loan < ApplicationRecord
  before_validation :error_or_message?

  def error_or_message?
    self.error = self.message = ""
    ["name", "mailing_address", "annual_income", "requested_loan_amount"].each do |attr|
      if attributes[attr].negative_zero_or_empty?
        self.error = "Please fill in the form completely"
        return
      end
    end
    req = attributes["requested_loan_amount"].to_i.to_f
    inc = attributes["annual_income"].to_i.to_f
# Avoid divide by zero, and apply the loan company's rules
    if inc < 1.0 || req > 50000.0 || req < 5000.0 || (req / inc) * 100.0 > 30.0
      self.error = "Loan application unsuccessful"
      return
    end
    self.message = "Loan application successful"
  end

end
