class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.bigint :balance, default: 0
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
