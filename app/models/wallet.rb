class Wallet < ApplicationRecord
  has_many :user_wallets, dependent: :destroy
  has_many :users, through: :user_wallets
  has_many :bank_accounts, class_name: "Bank::Account"
  has_many :bank_statements, class_name: "Bank::Statement"
  accepts_nested_attributes_for :user_wallets

  after_commit :set_first_statement


  def set_first_statement
    Bank::Statement.create(wallet_id: self.id)
  end

  def open_bank_statement
    self.bank_statements.where(closed: false).first rescue nil
  end
end
