# This class controls the printing of the Statement from the LEDGER
class StatementPrinter
  def print_statement(ledger)
    puts header
    ledger.transactions_record.reverse.each { |record|
      puts "#{time_formatter(record[:timestamp])} || #{number_formatter(record[:credit])} || #{number_formatter(record[:debit])} || #{number_formatter(record[:balance])}"
    }
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def number_formatter(value)
    value === '' ? value : '%.2f' % value
  end

  def time_formatter(timestamp)
    timestamp.strftime("%d/%m/%Y")
  end

end
