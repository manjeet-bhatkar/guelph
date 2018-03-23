class AddBankNameAndChequeNumberToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :bank_name, :string
    add_column :donations, :cheque_number, :string
  end
end
