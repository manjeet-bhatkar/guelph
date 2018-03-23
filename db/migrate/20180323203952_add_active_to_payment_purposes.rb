class AddActiveToPaymentPurposes < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_purposes, :active, :boolean, default: false
  end
end
