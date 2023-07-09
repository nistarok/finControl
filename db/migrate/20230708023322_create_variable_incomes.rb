class CreateVariableIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :variable_incomes do |t|
      t.string :mode
      t.string :name
      t.bigint :value
      t.date :trade_date

      t.timestamps
    end
  end
end
