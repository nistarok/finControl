class CreateBankTransitions < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_transitions do |t|
      t.string :name
      t.bigint :value
      t.string :display_name
      t.string :tags
      # t.belongs_to :origin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
