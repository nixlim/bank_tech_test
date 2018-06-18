# This class is a Command & Control Class for the application
class Bank
  def initialize(
      deposits_processor = DepositMoney.new,
      withdrawals_processor = WithdrawMoney.new,
      ledger = Ledger.new,
      printer = StatementPrinter.new
    )
    @deposits_processor = deposits_processor
    @withdrawals_processor = withdrawals_processor
    @ledger = ledger
    @printer = printer
  end

  def deposit(amount)
    check_for_incorrect_amount(amount)
    @deposits_processor.add(amount)
  end

  def withdraw(amount)
    check_for_incorrect_amount(amount)
    check_for_sufficient_balance(amount)
    @withdrawals_processor.add(amount)
  end

  def statement
    @printer.print_statement
  end

  private

  def check_for_incorrect_amount(amount)
    raise 'The amount must be greater than 0' unless
        amount.positive?
  end

  def check_for_sufficient_balance(amount)
    raise 'The balance is insufficient for withdrawal' unless
        @ledger.balance >= amount
  end
end
