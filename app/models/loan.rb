class Loan < ApplicationRecord
  validates :name, presence: { message: "Please fill in the form completely"  }
  validates :mailing_address, presence: { message: "Please fill in the form completely" }
  validates :annual_income, presence: { message: "Please fill in the form completely" }
  validates :requested_loan_amount, presence: { message: "Please fill in the form completely" }
end
