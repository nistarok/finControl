json.extract! bank_transaction, :id, :name, :value, :display_name, :tags, :created_at, :updated_at
json.url bank_transaction_url(bank_transaction, format: :json)
