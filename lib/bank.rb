require_relative 'ledger'
require_relative 'statement_printer'

# This class is a Command & Control Class for the application
class Bank
  def initialize(
      ledger = Ledger.new,
      printer = StatementPrinter.new,
      timestamp_creator = Time
    )
    @ledger = ledger
    @printer = printer
    @timestamp_creator = timestamp_creator
  end

  def deposit(amount)
    check_for_positive_amount(amount)
    @ledger.credit(amount, @timestamp_creator.new)
  end

  def withdraw(amount)
    check_for_positive_amount(amount)
    raise 'The balance is insufficient for withdrawal' unless
      @ledger.balance >= amount
    @ledger.debit(amount, @timestamp_creator.new)
  end

  def statement
    @printer.print_statement(@ledger)
  end

  private

  def check_for_positive_amount(amount)
    raise 'The amount must be greater than 0' unless
        amount.positive?
  end
end
