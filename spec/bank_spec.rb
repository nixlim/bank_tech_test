require 'bank'

describe Bank do
  let(:subject){described_class.new(deposit_money_instance_double, withdraw_money_instance_double)}
  let(:deposit_money_instance_double) {spy :deposit_money_double}
  let(:withdraw_money_instance_double) {spy :withdraw_money_double}

  describe '#deposit' do

    it 'should respond to #deposit method' do
      expect(subject).to respond_to(:deposit)
    end

    it 'should take an amount to be deposited' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'should call Depositor Class on deposit' do
      subject.deposit(10)
      expect(deposit_money_instance_double).to have_received(:add).with(10)
    end

    it 'should throw an error if the #deposit amount is 0 or less' do
      expect{subject.deposit(-10)}
          .to raise_error("The deposit amount must be greater than 0")
    end

  end

  describe '#withdraw' do

    it 'should respond to withdraw method' do

    end
  end

  
end