json.extract! bank_transition, :id, :name, :value, :display_name, :origin_id, :created_at, :updated_at
json.url bank_transition_url(bank_transition, format: :json)
