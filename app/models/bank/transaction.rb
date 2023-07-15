class Bank::Transaction < ApplicationRecord
  belongs_to :statement
end
