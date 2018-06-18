

class Bank

  def initialize (
      depositor = DepositMoney.new,
      withdrawer = WithdrawMoney.new
  )
    @depositor = depositor
  end

  def deposit(amount)
    raise 'The deposit amount must be greater than 0' unless
        check_for_incorrect_amount(amount)
    @depositor.add(amount)
  end

  private

  def check_for_incorrect_amount(amount)
    amount > 0
  end



end