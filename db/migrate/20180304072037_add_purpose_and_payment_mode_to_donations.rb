class AddPurposeAndPaymentModeToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :payment_purpose_id, :integer
    add_column :donations, :payment_mode_id, :integer
  end
end
