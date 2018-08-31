class AddErrorNotificationAndMessageToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :error, :string
    add_column :loans, :message, :string
  end
end
