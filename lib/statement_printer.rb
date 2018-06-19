class StatementPrinter
  def print_statement(ledger)
    puts header
    ledger.transactions_record.reverse.each { |record|
      puts "#{record[:entry_date]} || #{formatter(record[:credit])} || #{formatter(record[:debit])} || #{formatter(record[:balance])}" }
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def formatter(value)
    value === '' ? value : '%.2f' %value
  end


end