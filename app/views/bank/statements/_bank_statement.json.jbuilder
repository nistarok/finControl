json.extract! bank_statement, :id, :wallet_id, :closed, :closing_value, :closing_reference, :created_at, :updated_at
json.url bank_statement_url(bank_statement, format: :json)
