class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.datetime :donation_date
      t.integer :contact_id

      t.timestamps
    end
  end
end
