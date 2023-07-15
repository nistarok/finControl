class CreateBankStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_statements do |t|
      t.references :wallet, null: false, foreign_key: true
      t.boolean :closed, default: false
      t.bigint :closing_value
      t.date :closing_reference

      t.timestamps
    end
  end
end
