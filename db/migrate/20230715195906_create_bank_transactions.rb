class CreateBankTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_transactions do |t|
      t.string :name
      t.bigint :value
      t.string :display_name
      t.string :tags
      t.references :statements

      t.timestamps
    end
  end
end
