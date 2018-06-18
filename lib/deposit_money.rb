class DepositMoney

  def add(amount, ledger)
    ledger.credit(amount, get_date)
  end

  private

  def get_date
    @date = Time.new.strftime("%d/%m/%Y")
    p @date
  end

end