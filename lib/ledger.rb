# This Class records transactions
class Ledger
  attr_reader :balance, :transactions_record

  def initialize
    @transactions_record = []
    @balance = 0
  end

  def debit(amount, entry_date)
    @transactions_record.push({
      entry_date: entry_date.split(' ')[0],
      entry_time: entry_date.split(' ')[1],
      credit: '',
      debit: amount,
      balance: calculate_balance(-amount) })
  end

  def credit(amount, entry_date)
    @transactions_record.push({
      entry_date: entry_date.split(' ')[0],
      entry_time: entry_date.split(' ')[1],
      credit: amount,
      debit: '',
      balance: calculate_balance(amount) })
  end

  private
  def calculate_balance(amount)
    @balance += amount
  end

end
