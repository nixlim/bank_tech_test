# This Class records transactions
class Ledger
  attr_reader :balance, :transactions_record

  def initialize
    @transactions_record = []
    @balance = 0
  end

  def debit(amount, timestamp)
    @transactions_record.push({
      timestamp: timestamp,
      credit: '',
      debit: amount,
      balance: calculate_balance(-amount) })
  end

  def credit(amount, timestamp)
    @transactions_record.push({
      timestamp: timestamp,
      credit: amount,
      debit: '',
      balance: calculate_balance(amount) })
  end

  private
  def calculate_balance(amount)
    @balance += amount
  end

end
