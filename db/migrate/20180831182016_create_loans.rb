class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.string :name
      t.string :mailing_address
      t.integer :annual_income
      t.integer :requested_loan_amount
      t.timestamps
    end
  end
end
