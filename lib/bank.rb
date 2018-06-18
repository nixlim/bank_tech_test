

class Bank

  def initialize (depositor = Deposit.new)
    @depositor = depositor
  end

  def deposit(amount)
    @depositor.add(amount)
  end

end