class AddActiveToPaymentModes < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_modes, :active, :boolean
  end
end
