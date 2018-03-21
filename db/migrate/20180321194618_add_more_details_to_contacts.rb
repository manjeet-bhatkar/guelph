class AddMoreDetailsToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :middle_name, :string
    add_column :contacts, :is_life_member, :boolean
    add_column :contacts, :member_since, :date
    add_column :contacts, :phone_type, :integer
    add_column :contacts, :year_since_in_guelph, :string
  end
end
