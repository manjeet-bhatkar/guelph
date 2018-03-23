class AddCurrencyIdAndEventIdToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :currency_id, :integer
    add_column :donations, :event_id, :integer
  end
end
