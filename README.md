# loan_origination_no_validations

A coding exercise 

This version avoids validation before saving each loan application, because the requirements include that every loan application is saved, even if the user doesn't enter any information at all. The original version https://github.com/pdxrod/loan_origination did this by means of a kluj - it tried to save the loan, which did validation, then if it failed, it displayed some error message, then saved it anyway with validations:false. This version doesn't use Rails ActiveRecord validation at all - it just asks if there are any messages, shows them, then saves the loan application.
