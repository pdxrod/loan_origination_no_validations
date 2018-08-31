class Loan < ApplicationRecord
  validates :name, presence: { message: "Please fill in the form completely"  }
  validates :mailing_address, presence: { message: "Please fill in the form completely" }
  validates :annual_income, presence: { message: "Please fill in the form completely" }
  validates :requested_loan_amount, presence: { message: "Please fill in the form completely" }
  before_validation :do_the_math

  def do_the_math
    req = attributes["requested_loan_amount"].to_i.to_f
    inc = attributes["annual_income"].to_i.to_f
    if req > 50000.0 || req < 5000.0 || (req / inc) * 100.0 > 30.0
      self.errors.add :base, "Loan application unsuccessful"
    end
  end
end
