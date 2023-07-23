class Bank::Transaction < ApplicationRecord
  belongs_to :statement


  def decimal_value
    (self.value/100.to_f).round(2)
  end
end
