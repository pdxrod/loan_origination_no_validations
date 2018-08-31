class Loan < ApplicationRecord

  def self.validate_params( params )
    not_mt?( params["name"] ) && not_mt?( params["mailing_address"] ) && not_mt?( params["annual_income"] ) && not_mt?( params["requested_loan_amount"] )
  end

private
  def self.not_mt?( attr )
    ! attr.nil? && ! attr.trim == ""
  end

end
