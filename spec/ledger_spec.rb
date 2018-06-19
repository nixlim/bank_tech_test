require 'ledger'

describe Ledger do
  describe '#debit' do
    it 'should respond to the #debit method' do
      expect(subject).to respond_to(:debit).with(2).arguments
    end
  end

  describe '#credit' do
    it 'should respond to the #credit method' do
      expect(subject).to respond_to(:credit).with(2).arguments
    end
  end

  describe '#balance method/attribute' do
    it 'should respond to #balance and have @balance var' do
      expect(subject).to respond_to(:balance)
      expect(subject.balance).to eq(nil)
    end
  end

end