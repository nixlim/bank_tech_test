require 'bank'

describe Bank do
  let(:subject) {
    described_class.new(
      ledger_instance_double,
      printer_statement_double,
      time_class_double
    )
  }
  let(:ledger_instance_double) { spy :ledger_double, balance: 10 }
  let(:printer_statement_double) { spy :printer_statement_double }
  let(:time_class_double) { double :time_class_double, new: time_class_instance }
  let(:time_class_instance) { "2018-06-19" }

  describe '#deposit' do
    it 'should take an amount to be deposited' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
    it 'should throw an error if the #deposit amount is less than 0' do
      expect { subject.deposit(-10) }
        .to raise_error('The amount must be greater than 0')
    end
    it 'should throw an error if the #deposit amount is 0 ' do
      expect { subject.deposit(0) }
        .to raise_error('The amount must be greater than 0')
    end
    it 'should credit the Ledger Class' do
      subject.deposit(10)
      expect(ledger_instance_double).to have_received(:credit).with(10, time_class_instance)
    end
  end

  describe '#withdraw' do
    it 'should take an amount to be withdrawn' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    it 'should credit the Ledger Class' do
      subject.withdraw(10)
      expect(ledger_instance_double).to have_received(:debit).with(10, time_class_instance)
    end
    it 'should raise an error if the #withdraw amount is less than 0' do
      expect { subject.withdraw(-10) }
        .to raise_error('The amount must be greater than 0')
    end
    it 'should check with Ledger Class that the withdrawal does not exceed the available
 balance' do
      subject.withdraw(5)
      expect(ledger_instance_double).to have_received(:balance)
    end
    it 'should raise error if the #withdrawal amount exceeds the available balance' do
      expect { subject.withdraw(11) }
        .to raise_error('The balance is insufficient for withdrawal')
    end
  end

  describe '#statement' do
    it 'should call the StatementPrinter Class and provide a ledger' do
      subject.statement
      expect(printer_statement_double)
        .to have_received(:print_statement)
              .with(ledger_instance_double)
    end
  end
end
