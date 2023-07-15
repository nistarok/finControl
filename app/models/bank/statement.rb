class Bank::Statement < ApplicationRecord
  belongs_to :wallet
  has_many :transactions
end
