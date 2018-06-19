require 'statement_printer'

describe StatementPrinter do
  let(:ledger) {double :ledger_double, transactions_record: [
    {:entry_date=>"19/06/2018", :entry_time=>"12:51", :credit=>10, :debit=>"", :balance=>10},
    {:entry_date=>"19/06/2018", :entry_time=>"12:53", :credit=>"", :debit=>10, :balance=>0}
  ]}

  describe '#print_statement' do
    it 'should respond to #print_statement with 1 argument' do
      expect(subject).to respond_to(:print_statement)
        .with(1).argument
    end
    it 'should print the statement to the screen with a heading' do
      expect(STDOUT).to receive(:puts).with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts).with('19/06/2018 || 10 ||  || 10')
      expect(STDOUT).to receive(:puts).with('19/06/2018 ||  || 10 || 0')
      subject.print_statement(ledger)
    end

  end

end