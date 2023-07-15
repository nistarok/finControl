class AddAccountWalletReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :bank_accounts, :wallet, foreign_key: true
  end
end
