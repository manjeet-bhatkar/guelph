class ChangeDonationDate < ActiveRecord::Migration[5.0]
  def change
  	change_column :donations, :donation_date, :date
  end
end
