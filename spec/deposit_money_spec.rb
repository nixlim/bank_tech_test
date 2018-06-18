require 'deposit_money'

describe DepositMoney do
  describe '#add' do
    it 'should respond to #add method' do
      expect(subject).to respond_to(:add)
    end
    it 'should take an amount as an argument' do
      expect(subject).to respond_to(:add).with(1).argument
    end
  end


end