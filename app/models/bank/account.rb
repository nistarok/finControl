class Bank::Account < ApplicationRecord
  belongs_to :wallet

  validates_presence_of :name, :description
end
