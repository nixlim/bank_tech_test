# This Class controls adding DEBITS to the LEDGER
class WithdrawMoney

  def add(amount, ledger)
    ledger.debit(amount, record_date_time)
  end

  private

  def record_date_time
    Time.new.strftime("%d/%m/%Y %H:%M")
  end

end
