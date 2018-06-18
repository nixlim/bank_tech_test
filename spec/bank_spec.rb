require 'bank'

describe Bank do
  let(:subject) {
    described_class.new(
      deposit_money_instance_double,
      withdraw_money_instance_double,
      ledger_instance_double,
      printer_statement_double
    )
  }
  let(:deposit_money_instance_double) { spy :deposit_money_double }
  let(:withdraw_money_instance_double) { spy :withdraw_money_double }
  let(:ledger_instance_double) { spy :ledger_double, balance: 10 }
  let(:printer_statement_double) { spy :printer_statement_double }

  describe '#deposit' do
    it 'should take an amount to be deposited' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end
    it 'should call DepositMoney Class on deposit' do
      subject.deposit(10)
      expect(deposit_money_instance_double)
        .to have_received(:add).with(10)
    end
    it 'should throw an error if the #deposit amount is 0 or less' do
      expect { subject.deposit(-10) }
        .to raise_error('The amount must be greater than 0')
    end
  end

  describe '#withdraw' do
    it 'should take an amount to be withdrawn' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    it 'should call WithdrawMoney Class on withdrawal' do
      subject.withdraw(10)
      expect(withdraw_money_instance_double)
        .to have_received(:add).with(10)
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
  end

  describe '#statement' do
    it 'should call the StatementPrinter Class to print the statement' do
      subject.statement
      expect(printer_statement_double).to have_received(:print_statement)
    end
  end
end
