class Wallet < ApplicationRecord
  has_many :user_wallets, dependent: :destroy
  has_many :users, through: :user_wallets
  accepts_nested_attributes_for :user_wallets

end
