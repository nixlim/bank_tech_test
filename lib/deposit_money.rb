# This Class controls adding CREDITS to the LEDGER
class DepositMoney

  def add(amount, ledger)
    ledger.credit(amount, record_entry_date_time)
  end

  private

  def record_entry_date_time
    Time.new.strftime("%d/%m/%Y %H:%M")
  end

end
