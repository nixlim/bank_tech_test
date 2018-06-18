class DepositMoney

  def add(amount, ledger)
    ledger.credit(amount)
  end

end