class AddOriginRelation < ActiveRecord::Migration[7.0]
  def change
    add_reference :bank_transitions, :origin, foreign_key: true
  end
end
