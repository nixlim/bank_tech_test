require 'ledger'

describe Ledger do
  let(:time_class_instance) { "2018-06-19" }

  describe '#debit' do
    it 'should respond to the #debit method' do
      expect(subject).to respond_to(:debit).with(2).arguments
    end

    it 'should push amount and transaction timestamp into @transactions record array' do
      subject.debit(10, time_class_instance)
      expect(subject.instance_variable_get(:@transactions_record))
        .to include({
          timestamp: "2018-06-19",
          credit: '',
          debit: 10,
          balance: -10})
    end
  end

  describe '#credit' do
    it 'should respond to the #credit method' do
      expect(subject).to respond_to(:credit).with(2).arguments
    end
    it 'should push amount and transaction timestamp into @transactions record array' do
      subject.credit(10, time_class_instance)
      expect(subject.instance_variable_get(:@transactions_record))
        .to include({
          timestamp: "2018-06-19",
          credit: 10,
          debit: '',
          balance: 10})
    end

  end

end