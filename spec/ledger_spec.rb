require 'ledger'

describe Ledger do
  describe '@transactions_record' do
    it 'should have an empty ledger array on initialisation' do
      expect(subject.instance_variable_get(:@transactions_record))
        .to be_an_instance_of(Array)
      expect(subject.instance_variable_get(:@transactions_record))
        .to be_empty
    end
  end
  describe '#debit' do
    it 'should respond to the #debit method' do
      expect(subject).to respond_to(:debit).with(2).arguments
    end
    it 'should push amount and date of entry into @transactions record array' do
      subject.debit(10, Time.new.strftime("%d/%m/%Y %H:%M"))
      expect(subject.instance_variable_get(:@transactions_record))
        .to include({
          entry_date: Time.new.strftime("%d/%m/%Y"),
          entry_time: Time.new.strftime("%H:%M"),
          credit: '',
          debit: 10,
          balance: -10})
    end
  end

  describe '#credit' do
    it 'should respond to the #credit method' do
      expect(subject).to respond_to(:credit).with(2).arguments
    end
    it 'should push amount and date of entry into @transactions record array' do
      subject.credit(10, Time.new.strftime("%d/%m/%Y %H:%M"))
      expect(subject.instance_variable_get(:@transactions_record))
        .to include({
          entry_date: Time.new.strftime("%d/%m/%Y"),
          entry_time: Time.new.strftime("%H:%M"),
          credit: 10,
          debit: '',
          balance: 10})
    end
  end

  describe '#balance method/attribute' do
    it 'should respond to #balance and have @balance var' do
      expect(subject).to respond_to(:balance)
      expect(subject.balance).to eq(0)
    end
  end

end