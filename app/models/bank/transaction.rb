class Bank::Transaction < ApplicationRecord
  belongs_to :statement

  # broadcasts_to -> (transaction) {'transaction_list'}
  after_create_commit { broadcast_append_to statement }
  after_update_commit { broadcast_append_to statement }
  after_destroy_commit { broadcast_remove_to statement }

  validates_presence_of :name

  # after_update_commit do
  #   broadcast_replace_to('transaction_list', target: self, partial: "bank/transactions/transaction", locals: { transaction: self })
  # end




  def decimal_value
    (self.value/100.to_f).round(2)
  end
end
