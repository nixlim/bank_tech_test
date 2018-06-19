class StatementPrinter
  def print_statement(ledger)
    puts header
    ledger.transactions_record.reverse.each { |record|
      puts "#{record[:entry_date]} || #{record[:credit]} || #{record[:debit]} || #{record[:balance]}" }
  end

  private

  def header
    'date || credit || debit || balance'
  end


end