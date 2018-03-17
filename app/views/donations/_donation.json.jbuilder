json.extract! donation, :id, :amount, :donation_date, :contact_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
