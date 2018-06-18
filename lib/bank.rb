

class Bank

  def initialize (
      deposits_processor = DepositMoney.new,
      withdrawals_processor = WithdrawMoney.new
  )
    @deposits_processor = deposits_processor
    @withdrawals_processor = withdrawals_processor
  end

  def deposit(amount)
    raise 'The deposit amount must be greater than 0' unless
        check_for_incorrect_amount(amount)
    @deposits_processor.add(amount)
  end

  def withdraw(amount)

  end

  private

  def check_for_incorrect_amount(amount)
    amount > 0
  end



end