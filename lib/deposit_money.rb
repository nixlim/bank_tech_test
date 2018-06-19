class DepositMoney

  def add(amount, ledger)
    ledger.credit(amount, get_entry_date_time)
  end

  private

  def get_entry_date_time
    Time.new.strftime("%d/%m/%Y %H:%M")
  end

end