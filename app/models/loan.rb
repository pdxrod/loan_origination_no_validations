class Loan < ApplicationRecord
  validates :name, presence: true
  validates :mailing_address, presence: true
  validates :annual_income, presence: true
  validates :requested_loan_amount, presence: true
end
